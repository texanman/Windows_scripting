;------------------------------------------------
;Windows troubleshooting scripts
;
;v1.0
; 
;------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





; --- "Forced" Updated -- ;
; - Section uses send email fuction (refer to main file for help) -:

critupdate_text: ; <-----Critical windows patching where security forces update
MsgBox, 4, Critical update response, This response is only for tickets raised due to a forced restart of a critical Windows patch. If this is the case, please do not move the ticket to any other queue but resolve it with the message in this macro. You will also need to email our Global lead the ticket number so feedback can be gathered. This macro will also create this email for you and all you need to do is send it off.`n`n If this is for a forced restart of a critical path please select "Yes". Else select "No".
IfMsgBox No
	return
IfMsgBox Yes
	InputBox, Username, Personalize response, Please enter caller name., , 300, 160
	if (ErrorLevel > 0){
	MsgBox, Transfer template canceled
	Exit
	}
	critupdate1=
	(
Hello %Username%,

The forced restart has been scheduled with no ability to postpone due to critical security patches and updates that have to be applied to the entire estate as soon as possible.

We understand that this has caused some disruption and we apologise for the inconvenience. We will pass your feedback to the Security team to improve any future security patches/updates that will be released. 

Thank you,
IT team
	)
	SendRaw, %critupdate1%
	sleep 2000
	Send_email(ByRef SDLEAD, "Forced Critical Update ticket", "Afterrnoon IT Lead. %0D%0A%0D%0ABelow is a ticket created about a forced critical Windows update:")
	return


regupdate_text: ; <-----Regular patching that a user believes is forced
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
	if (ErrorLevel > 0){
	MsgBox, Transfer template canceled
	Exit
	}
regupdate1 =
(
Hello %Username%,

By default all non-critical Windows updates have a 1-3 week window of installation. If not installed within this timeframe then Windows will forcefully require a reboot to install the updates. For more information about the Windows update policy, please see the  article below:

Article: <URL>

)
BlockInput, on
SendRaw, %regupdate1%
BlockInput, off
Gosub, Ticket_End
return
