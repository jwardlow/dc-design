(*
This script automates most of the workflow for a redesign roll.
It can move design assets between our demonstration and production instances.
File paths need to be customized to your Mac before using.
*)

-- Ask what type of context we're implementing, set the answer as "c"
set c to (choose from list {"Site", "Journal", "Event"} with prompt "What type of context?" default items "Site")

-- Make the cancel button work
if c = false then
	error number -128
else
	set c to c as string
end if

-- Assign variables for shortname and production URL
set shortname to text returned of (display dialog "Please enter the IR shortname or structure url label:" default answer "") as string
set targetURL to text returned of (display dialog "Please enter the production URL (no http:// or ending /):" default answer "") as string

if c = "Site" then
	set irShortname to shortname
else
	set irShortname to text returned of (display dialog "Please enter the IR-level shortname:" default answer "") as string
end if

tell application "Terminal"
	-- On schedule_tasks, make a directory to which to upload assets
	set schedTab to do script ("schedtasks")
	delay 8
	
	-- check for login failure, option to correct
	set histText to history of schedTab
	repeat until histText contains "ubuntu@"
		display dialog "Login failed, time to fix known_hosts."
		set lineLocation to offset of "Offending ECDSA key" in histText
		set s to lineLocation + 56
		set e to lineLocation + 58
		set lineNo to characters s thru e of histText as string
		if character 3 of lineNo is " " then
			set lineNo to characters 1 thru 2 of lineNo as string
		end if
		activate
		do script ("vi +" & lineNo & " ~/.ssh/known_hosts")
		delay 10
		do script ("schedtasks") in schedTab
		delay 8
		set histText to history of schedTab
	end repeat
	
	do script ("cd /var/log/sequoia/application/") in schedTab
	do script ("mkdir ./" & shortname & "-assets") in schedTab
	do script ("sequoia") in schedTab
	my cdSchedAssets()
	-- check if directory exists, let us know if not
	set histText to history of schedTab
	repeat until histText contains "production@schedule:/srv/sequoia/main/data"
		set targetURL to text returned of (display dialog "Directory not found, change production URL?" default answer "") as string
		my cdSchedAssets()
		set histText to history of schedTab
	end repeat
	do script ("find . -maxdepth 1 -type f -name \"*.*\" | sort") in schedTab
	activate
	set demoTab to do script ("demo")
	my cdDemoAssets()
	do script ("find . -maxdepth 1 -type f -name \"*.*\" | sort") in demoTab
	activate
end tell

tell application "Google Chrome"
	open location "http://textmechanic.com/text-tools/basic-text-tools/remove-duplicate-lines/"
end tell

display dialog "Save lists of live- and demo-site assets. De-dupe, then click OK to continue."

tell application "Terminal"
	do script ("ls -ltr") in demoTab
	activate
end tell

set numDays to text returned of (display dialog "Number of days since which to find modified files?" default answer "") as string

tell application "Terminal"
	do script ("find . -type f -mtime -" & numDays & " | sort -h") in demoTab
end tell

-- Provide option to download files
set yn to button returned of (display dialog "Download any files?" buttons {"No", "Yes"} default button "Yes")

if yn is "Yes" then
	set enteredAssets to the text returned of (display dialog "Enter file names to download, separated by commas and spaces:" default answer "")
	-- This bit with oldDels is good practice because "AppleScript's text item delimiters" are a system-wide setting - if changed, will change in all other scripts running on your Mac
	set oldDels to AppleScript's text item delimiters
	set AppleScript's text item delimiters to ", "
	set assetList to (every text item of enteredAssets)
	set AppleScript's text item delimiters to oldDels
	-- Download each file we entered in the dialog
	repeat with theCurrentListItem in assetList
		if c = "Site" then
			do shell script "scp demo:/main/demo/doc/data/" & targetURL & "/assets/" & theCurrentListItem & " ~/Downloads/."
		else
			do shell script "scp demo:/main/demo/doc/data/journals/" & targetURL & "/" & shortname & "/assets/" & theCurrentListItem & " ~/Downloads/."
		end if
	end repeat
	do shell script "open ~/Downloads ~/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname & "/Assets"
	display dialog "Move files from Downloads to local assets folder. Click OK to proceed."
end if

tell application "Google Chrome"
	if c = "Site" then
		open location "http://demo." & irShortname & ".bepress.com/cgi/user_config.cgi"
		open location "https://" & targetURL & "/cgi/user_config.cgi"
	else
		open location "http://demo." & irShortname & ".bepress.com/cgi/user_config.cgi?context=" & shortname
		open location "https://" & targetURL & "/cgi/user_config.cgi?context=" & shortname
	end if
end tell
display dialog "Copy the design configs from demo to live. Click OK to proceed."

-- Once all needed assets are saved locally, copy from local machine to sequoia
do shell script "scp -r /Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname & "/Assets/* schedule_task.production.bepress.com:/var/log/sequoia/application/" & shortname & "-assets/."

-- copy files into production FILETREE
tell application "Terminal"
	my cdSchedAssets()
	do script ("cp /usr/bepress/production/log/" & shortname & "-assets/* .") in schedTab
	do script ("cd $FILETREE/bin") in schedTab
	if c = "Site" then
		do script ("./update.pl -template=ir-local.css http://" & targetURL) in schedTab
		do script ("./update.pl -template=ir-custom.css http://" & targetURL) in schedTab
		do script ("./update.pl -template=index.html http://" & targetURL) in schedTab
		do script ("python3 update-activity-by-year-pages.py") in schedTab
	else
		do script ("./update.pl -template=ir-local.css http://" & targetURL & "/" & shortname) in schedTab
		do script ("./update.pl -template=ir-custom.css http://" & targetURL & "/" & shortname) in schedTab
		do script ("./update.pl -template=index.html http://" & targetURL & "/" & shortname) in schedTab
	end if
end tell

tell application "Google Chrome"
	if c = "Site" then
		open location "http://demo." & irShortname & ".bepress.com/"
		open location "https://" & targetURL
	else
		open location "http://demo." & irShortname & ".bepress.com/" & shortname
		open location "https://" & targetURL & "/" & shortname
	end if
end tell

display dialog "If everything looks good, queue a non-immediate site-level update. 'Hi CS, I've updated the site level with the new design. Please go ahead and queue a recursive update if all looks good there. Please also follow the steps outlined on the DC Redesign Workflow page (https://elsevier.atlassian.net/wiki/spaces/RMCS/pages/119600947120520/DC+Redesign+Workflow#DCRedesignWorkflow-Site-MatchingStructures(IRredesignsonly)) to determine whether you need to file a separate SUP for any site-matching journals/event communities with custom banners.'"

on cdSchedAssets()
	global c, targetURL, schedTab, shortname
	tell application "Terminal"
		if c = "Site" then
			do script ("cd $FILETREE/data/" & targetURL & "/assets") in schedTab
		else
			do script ("cd $FILETREE/data/journals/" & targetURL & "/" & shortname & "/assets") in schedTab
		end if
		delay 5
	end tell
end cdSchedAssets

on cdDemoAssets()
	global c, targetURL, demoTab, shortname
	tell application "Terminal"
		if c = "Site" then
			do script ("cd $FILETREE/data/" & targetURL & "/assets") in demoTab
		else
			do script ("cd $FILETREE/data/journals/" & targetURL & "/" & shortname & "/assets") in demoTab
		end if
		delay 5
	end tell
end cdDemoAssets
