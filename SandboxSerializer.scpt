(* Automates the use of context-copier.pl for serializing between sandbox and live sites.
Based on original work by Stephen Fisk. *)

display dialog "Please enter a URL to archive" default answer ""
set archive_url to text returned of the result as string

display dialog "Please enter a URL to restore to" default answer ""
set target_url to text returned of the result as string

display dialog "Please enter a shortname to use" default answer ""
set tmp_name to text returned of the result as string

display dialog "Please confirm correct URLs." & return & return & "Archive:  " & archive_url & return & "Restore:  " & target_url

tell application "Terminal"
	set schedTab to do script ("schedtasks")
	delay 8
	do script ("sequoia") in schedTab
	delay 3
	do script ("cd $FILETREE/bin") in schedTab
	do script ("./context-copier.pl serialize -c " & archive_url & " -a ~/tmp/" & tmp_name & ".serialized.tar.gz") in schedTab
	delay 10
	do script ("./context-copier.pl restore -c " & target_url & " -a ~/tmp/" & tmp_name & ".serialized.tar.gz") in schedTab
	delay 15
	do script ("./update.pl -skip_sw_gallery -recurse " & target_url) in schedTab
	delay 15
	set histText to history of schedTab
	do script ("rm ~/tmp/" & tmp_name & ".serialized.tar.gz") in schedTab
end tell

set mdc_sandbox to findAndReplaceInText(archive_url, tmp_name, "/cgi/metadata_config.cgi?context=" & tmp_name)

set mdc_live to findAndReplaceInText(target_url, tmp_name, "/cgi/metadata_config.cgi?context=" & tmp_name)

tell application "Google Chrome"
	open location mdc_sandbox
	open location mdc_live
end tell

if histText contains "A backup of original configuration" then
	display dialog "Check metadata config, copy if necessary.
	
	Hi CS, the live site should be good to go (may need to hard-refresh): " & target_url
else if histText contains "is not a valid context" then
	display dialog "Hi CS, I’m not seeing a journal structure at " & target_url & ", can you pass this back when that’s ready? TIA!"
else
	tell application "Terminal"
		activate
	end tell
end if

on findAndReplaceInText(theText, theSearchString, theReplacementString)
	set AppleScript's text item delimiters to theSearchString
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to theReplacementString
	set theText to theTextItems as string
	set AppleScript's text item delimiters to ""
	return theText
end findAndReplaceInText
