;---------------------------------
;
;
;
;---------------------------------





#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; -- TRIAGE MACROS section -- #


Opening_TXT:

InputBox, Username, Personalize response, Please enter caller name., , 300, 160 ; This input box allows you to customize the response using the ticket creators name
if (ErrorLevel > 0){
	MsgBox, Macro canceled
	Exit
}
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello %Username%,
Send {Enter 2}
SendRaw, IT has acknowledged your ticket and will respond as soon as possible. If you feel the need for quicker service please contact us via phone numbers listed below:
Send {Enter 2}
sleep 50
Gosub, sdnumber
Send {Enter 2}
SendRaw, Thanks,
Send, {Enter 1}
SendRaw, %SDNAME%
Send {Enter 3}
sleep 50
BlockInput, off ; turns off prevention from accidential typing while script is running
return


Reminder_TXT:
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Macro canceled
	Exit
}
BlockInput on  ;turns on prevention from accidential typing while script is running
SendRaw, Hello %Username%,
Send {Enter 2}
SendRaw, We are currently awaiting your response regarding your open ticket. Please let us know what we can do to ensure this is resolved for you. 
Send {Enter 2}
SendRaw, Thanks,
Send {Enter 1}
SendRaw, %SDNAME%
BlockInput off  ;turns off prevention from accidential typing while script is running
return



Waiting_3rd_party_TXT:
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Macro canceled
	Exit
}
BlockInput on  ;turns on prevention from accidential typing while script is running
SendRaw, Hello %Username%,
Send {Enter 2}
SendRaw, We are currently waiting for our vendor to respond to our ticket. Sorry for any delays this may be causing. We will update this ticket as soon as we recieve a response.
Send {Enter 2}
SendRaw, Thanks,
Send {Enter 1}
SendRaw, %SDNAME%
BlockInput off  ;turns off prevention from accidential typing while script is running
return



Transfering_Queue_TXT:
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Macro canceled
	Exit
}
else
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello %Username%,
Send {Enter 2}
SendRaw, IT has acknowledged your ticket. We will pass this onto the correct group to look further into ticket. If at anytime you feel your needs not being met. Please contact us on our support system line.
Send {Enter 2}
sleep 50
GoSub, sdnumber
Send, {Enter 2}
sleep 25
SendRaw, Kind regards,
Send, {Enter 2}
SendRaw, %SDNAME%
Send {Enter 2}
BlockInput, off ; turns off prevention from accidential typing while script is running
Return


Ticket_End:
SendRaw,If you have any further issues feel free to raise a new ticket in our  system or give support number a call. We can be reached at:
sleep 200
Send {Enter 2}
GoSub, sdnumber
Send {Enter 3}
SendRaw, Kind regards,
Send {Enter 2}
SendRaw, %SDNAME%
Send {Enter 2}
sleep 50
Return


