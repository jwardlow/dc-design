(* Automates the use of context-copier.pl for serializing between demo and live sites.
Based on original work by Stephen Fisk. *)

display dialog "Please enter a URL to archive" default answer ""
set archive_url to text returned of the result as string

display dialog "Please enter a URL to restore to" default answer ""
set target_url to text returned of the result as string

display dialog "Please enter a shortname to use" default answer ""
set tmp_name to text returned of the result as string

display dialog "Please confirm correct URLs." & return & return & "Archive:  " & archive_url & return & "Restore:  " & target_url

tell application "Terminal"
	set demoTab to do script ("demo")
	delay 8
	do script ("sudo su - demo") in demoTab
	delay 3
	do script ("cd $FILETREE/bin") in demoTab
	do script ("./context-copier.pl serialize -c " & archive_url & " -a ~/tmp/" & tmp_name & ".serialized.tar.gz") in demoTab
	delay 10
	set homeTab to do script ("scp demo:/home/demo/tmp/" & tmp_name & ".serialized.tar.gz ~/tmp/.")
	delay 10
	do script ("scp ~/tmp/" & tmp_name & ".serialized.tar.gz schedule_task.production.bepress.com:/var/log/sequoia/application/.") in homeTab
	delay 10
	
	set schedTab to do script ("schedtasks")
	delay 10
	do script ("sequoia") in schedTab
	delay 5
	do script ("cd $FILETREE/bin") in schedTab
	delay 3
	do script ("./context-copier.pl restore -c " & target_url & " -a /usr/bepress/production/log/" & tmp_name & ".serialized.tar.gz") in schedTab
	delay 15
	do script ("./update.pl -skip_sw_gallery " & target_url) in schedTab
	delay 15
	set histText to history of schedTab
	do script ("exit") in schedTab
	do script ("rm /var/log/sequoia/application/" & tmp_name & ".serialized.tar.gz") in schedTab
end tell

if histText contains "A backup of original configuration" then
	display dialog "Hi CS, the live site should be good to go (may need to hard-refresh): " & target_url
else if histText contains "is not a valid context" then
	display dialog "Hi CS, I’m not seeing a journal structure at " & target_url & ", can you pass this back when that’s ready? TIA!"
else
	tell application "Terminal"
		activate
	end tell
end if