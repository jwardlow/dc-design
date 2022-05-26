(*
This script automates most of the workflow for a brand-new DC site roll.
It can move design assets between our demonstration and production instances.
File paths need to be customized to your Mac before using.
*)

-- Assign variables for IR shortname and production URL
set shortname to text returned of (display dialog "Please enter the IR shortname:" default answer "") as string
set targetURL to text returned of (display dialog "Please enter the demo base url (no http:// or ending /):" default answer "") as string

tell application "Terminal"
	-- On schedule_tasks, make a directory to which to upload assets
	set schedTab to do script ("schedtasks")
	delay 10
	--check for login failure, option to correct
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
	
	-- List files currently in the demo site's asset folder, so we can download any we don't already have saved locally
	set demoTab to do script ("demo")
	do script ("cd $FILETREE/data/" & targetURL & "/assets") in demoTab
	-- check if directory exists, let us know if not
	delay 8
	set histText to history of demoTab
	repeat until histText contains "demo:/main/demo/doc/data/"
		set targetURL to text returned of (display dialog "Directory not found, change demo base url?" default answer "") as string
		do script ("cd $FILETREE/data/" & targetURL & "/assets") in demoTab
		delay 5
		set histText to history of demoTab
	end repeat
	do script ("find . -type f | sort -h") in demoTab
	activate
end tell

-- Provide option to download files. Customize this with your file paths.
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
		do shell script "scp demo:/main/demo/doc/data/" & targetURL & "/assets/" & theCurrentListItem & " ~/Downloads/."
	end repeat
	do shell script "open ~/Downloads ~/Design/Implementations/Sites/Site-designs/" & shortname & "/Assets"
	display dialog "Move files from Downloads to local assets folder. Click OK to proceed."
end if

-- Once all needed assets are saved locally, copy from local machine to sequoia. Customize with your file paths.
do shell script "scp -r /Users/wardlowj/Design/Implementations/Sites/Site-designs/" & shortname & "/Assets/* schedule_task.production.bepress.com:/var/log/sequoia/application/" & shortname & "-assets/."

-- Log into sequoia and copy files into production FILETREE
tell application "Terminal"
	do script ("sequoia") in schedTab
	do script ("cd $FILETREE/data/" & targetURL & "/assets") in schedTab
	do script ("cp /usr/bepress/production/log/" & shortname & "-assets/* .") in schedTab
end tell

display dialog "Assets in place! To finish:" & return & "1. Set configs on live site to match demo" & return & "2. Go to advanced settings, change 'Is Element Visible?' to 'Yes'" & return & "3. Update the site" & return & "4. Enable SSL (if it's not already)" & return & "5. Assign back to the CSer!"
