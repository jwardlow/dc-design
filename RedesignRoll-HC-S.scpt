(*
This script automates most of the workflow for a redesign roll.
It can move design assets between our sandbox and production instances.
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

-- Set up a path to the project folder where we'll find & replace the URLs in the docs that make set_config.pl work - customize this for whatever folder structure you use to hold project files
set pfolder to "/Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname
-- Find & replace those URLs
do shell script "find " & pfolder & " -type f -print0 | xargs -0 sed -i '' 's/" & irShortname & "-sandbox.digital-commons.com/" & targetURL & "/g'"
do shell script "open " & pfolder

tell application "Terminal"
	set schedTab to do script ("schedtasks")
	delay 3
	-- make a directory to hold files for setting simple configs later
	do script ("cd /var/log/sequoia/application/") in schedTab
	do script ("mkdir ./" & shortname & "-assets") in schedTab
	
	do script ("sequoia") in schedTab
	delay 3
	my cdSchedAssets()
	-- check if directory exists, let us know if not
	set histText to history of schedTab
	repeat until histText contains "production@schedule:/srv/sequoia/main/data"
		set targetURL to text returned of (display dialog "Directory not found, change production URL?" default answer "") as string
		my cdSchedAssets()
		set histText to history of schedTab
	end repeat
	do script ("find . -maxdepth 1 -type f -name \"*.*\" | sort") in schedTab
	my cdSandboxAssets()
	do script ("find . -maxdepth 1 -type f -name \"*.*\" | sort") in schedTab
	activate
end tell

-- upload files for setting simple configs
do shell script "scp -r /Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname & "/Assets/" & c & "Configs.txt /Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname & "/Assets/" & c & "URL.txt schedule_task.production.bepress.com:/var/log/sequoia/application/" & shortname & "-assets/."

tell application "Google Chrome"
	open location "http://textmechanic.com/text-tools/basic-text-tools/remove-duplicate-lines/"
end tell

display dialog "Save lists of sandbox and live-site assets. De-dupe, make a list of assets to copy to live, then click OK to continue."

tell application "Terminal"
	do script ("ls -ltr") in schedTab
	delay 5
	activate
	set enteredAssets to the text returned of (display dialog "Enter file names to copy, separated by commas and spaces:" default answer "")
	-- This bit with oldDels is good practice because "AppleScript's text item delimiters" are a system-wide setting - if changed, will change in all other scripts running on your Mac
	set oldDels to AppleScript's text item delimiters
	set AppleScript's text item delimiters to ", "
	set assetList to (every text item of enteredAssets)
	set AppleScript's text item delimiters to oldDels
	-- copy desired files to production
	my cdSchedAssets()
	repeat with theCurrentListItem in assetList
		if c = "Site" then
			do script "cp /srv/sequoia/main/data/" & irShortname & "-sandbox.digital-commons.com/assets/" & theCurrentListItem & " ." in schedTab
		else
			do script "cp /srv/sequoia/main/data/journals/" & irShortname & "-sandbox.digital-commons.com/" & shortname & "/assets/" & theCurrentListItem & " ." in schedTab
		end if
	end repeat
	--	do script ("rm " & c & "Configs.txt") in schedTab
	--	do script ("rm " & c & "URL.txt") in schedTab
	do script ("cd $FILETREE/bin") in schedTab
	if c = "Site" then
		do script ("./update.pl -template=ir-local.css http://" & targetURL) in schedTab
		do script ("./update.pl -template=ir-custom.css http://" & targetURL) in schedTab
		do script ("./update.pl -template=index.html http://" & targetURL) in schedTab
	else
		do script ("./update.pl -template=ir-local.css http://" & targetURL & "/" & shortname) in schedTab
		do script ("./update.pl -template=ir-custom.css http://" & targetURL & "/" & shortname) in schedTab
		do script ("./update.pl -template=index.html http://" & targetURL & "/" & shortname) in schedTab
	end if
	--end tell
	
	--Set simple configs
	set nav to (choose from list {"Above", "Below", "Hidden"} with prompt "Nav bar position?" default items "Below") as string
	
	set sidebar to button returned of (display dialog "Sidebar position?" buttons {"Left", "Right"}) as string
	
	if c = "Journal" then
		set support_coverart to button returned of (display dialog "Enable issue cover art?" buttons {"Yes", "No"}) as string
		set intro_above to button returned of (display dialog "Display intro text above cover art?" buttons {"Yes", "No"}) as string
		set publish_by_issue to button returned of (display dialog "Publish by closing issues?" buttons {"Yes", "No"}) as string
	end if
	
	--tell application "Terminal"
	do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "Configs.txt") in schedTab
	if nav = "Below" then
		do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "URL.txt -CONFIG='NAV_UNDER' -VALUE=1") in schedTab
	else if nav = "Hidden" then
		do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "URL.txt -CONFIG='hide_nav' -VALUE=1") in schedTab
	end if
	
	if sidebar = "Left" then
		do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "URL.txt -CONFIG='HIDE_IR_SIDEBAR_RIGHT' -VALUE=1") in schedTab
	end if
	
	if c = "Journal" and support_coverart = "Yes" then
		do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "URL.txt -CONFIG='support_coverart' -VALUE=1") in schedTab
	end if
	if c = "Journal" and intro_above = "Yes" then
		do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "URL.txt -CONFIG='intro_above_image' -VALUE=1") in schedTab
	end if
	if c = "Journal" and publish_by_issue = "Yes" then
		do script ("$FILETREE/bin/set_config.pl /usr/bepress/production/log/" & shortname & "-assets/" & c & "URL.txt -CONFIG='publish_by_issue' -VALUE=1") in schedTab
	end if
	
	if c = "Site" then
		do script ("python3 update-activity-by-year-pages.py") in schedTab
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

on cdSandboxAssets()
	global c, targetURL, schedTab, shortname, irShortname
	tell application "Terminal"
		if c = "Site" then
			do script ("cd $FILETREE/data/" & irShortname & "-sandbox.digital-commons.com/assets") in schedTab
		else
			do script ("cd $FILETREE/data/journals/" & irShortname & "-sandbox.digital-commons.com/" & shortname & "/assets") in schedTab
		end if
		delay 5
	end tell
end cdSandboxAssets
