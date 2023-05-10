(*
This script automates the more repetitive portions of the DC design implementation workflow.
It can set up a new project folder on your Mac and copy templates to use in the implementation,
upload assets to a sandbox site once they’re ready, and set simple configurations using the script
set_config.pl. The file paths and username need to be customized to your Mac before using.
*)

-- Ask what type of context we're implementing, set the answer as "c"
set c to (choose from list {"Site", "Journal", "Event"} with prompt "What type of context?" default items "Site")

-- Make the cancel button work
if c = false then
	error number -128
else
	set c to c as string
end if

-- Ask for shortname & URL label
set irShortname to text returned of (display dialog "Please enter the IR-level shortname:" default answer "") as string
if c ≠ "Site" then
	set shortname to text returned of (display dialog "Please enter the structure URL label:" default answer "") as string
else
	set shortname to irShortname
end if

set targetURL to irShortname & "-sandbox.digital-commons.com"

set task to button returned of (display dialog "What would you like to do?" buttons {"Make new folder", "Upload assets", "Cancel"} default button "Make new folder" cancel button "Cancel")

-- Begin code to create new project folder
if task = "Make new folder" then
	-- Specify header-only designs so we can copy a different set of templates for them
	if c ≠ "Site" then
		set headerOnly to button returned of (display dialog "Header-only?" buttons {"Yes", "No"}) as string
	end if
	
	-- Set up a path in the appropriate context type's folder where we'll create the new project folder - customize this for whatever folder structure you use to hold project files
	set pfolder to "/Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname
	
	-- Set up a path to the "templates" folder for the appropriate context type. Everything in the templates folder will be copied into the new project folder, customize as desired
	if c ≠ "Site" and headerOnly = "Yes" then
		set tfolder to "/Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-templates-header-only-sandbox/"
	else
		set tfolder to "/Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-templates-sandbox/"
	end if
	
	-- This variable will be used for renaming in case there's already a folder with the name we want to use, customize as desired
	set rfolder to pfolder & "-og"
	
	-- This variable is a shortcut for copying everything in the templates folder to the new project folder
	set cpCmd to "cp -R " & tfolder & " " & pfolder
	
	--Try making the new project folder. If it already exists, rename the original one, then create the new one. Copy everything in the templates folder to the new project folder.
	try
		do shell script "mkdir " & pfolder
		do shell script cpCmd
	on error
		do shell script "mv " & pfolder & " " & rfolder
		do shell script cpCmd
	end try
	
	-- Find & replace LOCALID & irShortname in newly-created templates
	do shell script "find " & pfolder & " -type f -print0 | xargs -0 sed -i '' 's/LOCALID/" & shortname & "/g'"
	do shell script "find " & pfolder & " -type f -print0 | xargs -0 sed -i '' 's/irShortname/" & irShortname & "/g' "
	
	-- Open up the new project folder, setup doc, config doc, & ir-local for convenience
	if c ≠ "Site" and headerOnly = "Yes" then
		do shell script "open " & pfolder & " " & pfolder & "/" & c & "Setup.txt" & " " & pfolder & "/Assets/ir-local.css"
	else
		do shell script "open " & pfolder & " " & pfolder & "/" & c & "Setup.txt" & " " & pfolder & "/Assets/" & c & "Configs.txt" & " " & pfolder & "/Assets/ir-local.css"
	end if
	
	-- Provide option to upload assets now, or quit and come back later
	display dialog "Upload assets?" buttons {"Yes please", "Not now"} default button "Yes please" cancel button "Not now"
end if

-- Begin code to upload assets

--Specify Boolean simple configs since we can't do them via text file
if task ≠ "Make new folder" and c ≠ "Site" then
	set headerOnly to button returned of (display dialog "Header-only?" buttons {"Yes", "No"}) as string
end if

set nav to (choose from list {"Above", "Below", "Hidden"} with prompt "Nav bar position?" default items "Below") as string

set sidebar to button returned of (display dialog "Sidebar position?" buttons {"Left", "Right"}) as string

if c = "Journal" then
	set support_coverart to button returned of (display dialog "Enable issue cover art?" buttons {"Yes", "No"}) as string
	set intro_above to button returned of (display dialog "Display intro text above cover art?" buttons {"Yes", "No"}) as string
	set publish_by_issue to button returned of (display dialog "Publish by closing issues?" buttons {"Yes", "No"}) as string
end if

-- Set up a path to the asset folder on local machine - customize this for whatever folder structure you use to hold project files
set pfolder to "/Users/wardlowj/Design/Implementations/" & c & "s/" & c & "-designs/" & shortname

-- Open a window in Terminal, log in to schedtasks, and make a folder to hold assets temporarily
tell application "Terminal"
	set schedTab to do script ("schedtasks")
	delay 15
	do script ("cd /var/log/sequoia/application/") in schedTab
	delay 3
	do script ("mkdir ./" & shortname & "-assets") in schedTab
end tell
delay 10
-- scp assets from local asset folder to temp folder
do shell script "scp -r " & pfolder & "/Assets/* schedule_task.production.bepress.com:/var/log/sequoia/application/" & shortname & "-assets/."

-- In the Terminal window where we're logged in to schedtasks, log in to sequoia, change to the sandbox site's asset folder
tell application "Terminal"
	do script ("sequoia") in schedTab
	my cdAssets()
	
	set tmpPath to "/usr/bepress/production/log/" & shortname & "-assets/"
	
	-- copy files from temp folder to sandbox site, set configs, & update
	
	do script ("cp " & tmpPath & "* .") in schedTab
	delay 5
	
	do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='invisible' -VALUE=0 -verbose") in schedTab
	delay 10
	-- check if we got the right irShortname, option to change if not
	set histText to history of schedTab
	repeat until histText contains "build_configs_list: context_url:"
		set irShortname to text returned of (display dialog "Config setting failed, change IR-level shortname?" default answer "") as string
		do script ("$FILETREE/bin/set_config.pl /home/jwardlow/tmp/" & shortname & "/" & c & "URL.txt -CONFIG='invisible' -VALUE=0 -verbose") in schedTab
		delay 5
		set histText to history of schedTab
	end repeat
	
	if c ≠ "Site" and headerOnly = "Yes" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='inherit_site_design' -VALUE=1") in schedTab
	else
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "Configs.txt") in schedTab
	end if
	
	if nav = "Above" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='NAV_UNDER' -VALUE=0") in schedTab
	else if nav = "Below" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='NAV_UNDER' -VALUE=1") in schedTab
	else if nav = "Hidden" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='hide_nav' -VALUE=1") in schedTab
	end if
	
	if sidebar = "Right" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='HIDE_IR_SIDEBAR_RIGHT' -VALUE=0") in schedTab
	else if sidebar = "Left" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='HIDE_IR_SIDEBAR_RIGHT' -VALUE=1") in schedTab
	end if
	
	if c = "Journal" and support_coverart = "Yes" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='support_coverart' -VALUE=1") in schedTab
	end if
	if c = "Journal" and intro_above = "Yes" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='intro_above_image' -VALUE=1") in schedTab
	end if
	if c = "Journal" and publish_by_issue = "Yes" then
		do script ("$FILETREE/bin/set_config.pl " & tmpPath & c & "URL.txt -CONFIG='publish_by_issue' -VALUE=1") in schedTab
	end if
	
	delay 10
	my updateSiteLevel()
	delay 10
	do script ("rm " & c & "Configs.txt") in schedTab
	do script ("rm " & c & "URL.txt") in schedTab
end tell

-- Now that the initial batch of assets is in place, provide options to make changes as we work on the design
repeat
	set btnReturned to button returned of (display dialog "Upload in progress! Upload a new version?" buttons {"ir-local.css", "Something else", "All done"})
	if btnReturned = "ir-local.css" then
		do shell script "scp " & pfolder & "/Assets/ir-local.css schedule_task.production.bepress.com:/var/log/sequoia/application/" & shortname & "-assets/."
		tell application "Terminal"
			do script ("cp " & tmpPath & "ir-local.css .") in schedTab
			if c = "Site" then
				do script ("$FILETREE/bin/update.pl http://" & targetURL & " -template=ir-local.css") in schedTab
			else
				do script ("$FILETREE/bin/update.pl http://" & targetURL & "/" & shortname & " -template=ir-local.css") in schedTab
			end if
		end tell
	else if btnReturned = "Something else" then
		set template to text returned of (display dialog "Enter a file name to upload:" default answer "") as string
		do shell script "scp -r " & pfolder & "/Assets/" & template & " schedule_task.production.bepress.com:/var/log/sequoia/application/" & shortname & "-assets/."
		tell application "Terminal"
			do script ("cp " & tmpPath & template & " .") in schedTab
			my updateSiteLevel()
		end tell
	else if btnReturned = "All done" then
		display dialog "Hi CS,

This site should be all set: " & targetURL & "

Please take a moment to look over the design and make sure everything looks ok. If you have any questions or concerns, let me know. Otherwise, feel free to pass it along to the client!" buttons {"great job!"} cancel button "great job!"
	end if
end repeat

on cdAssets()
	global c, targetURL, schedTab, shortname
	tell application "Terminal"
		if c = "Site" then
			do script ("cd $FILETREE/data/" & targetURL & "/assets") in schedTab
		else
			do script ("cd $FILETREE/data/journals/" & targetURL & "/" & shortname & "/assets") in schedTab
		end if
		delay 5
	end tell
end cdAssets

on updateSiteLevel()
	global c, irShortname, shortname, targetURL, schedTab
	tell application "Terminal"
		if c = "Site" then
			do script ("$FILETREE/bin/update.pl " & targetURL) in schedTab
		else
			do script ("$FILETREE/bin/update.pl " & targetURL & "/" & shortname) in schedTab
		end if
	end tell
end updateSiteLevel