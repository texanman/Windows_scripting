#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; Phones

phone_creation_closing_TXT:

InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
InputBox, insidenumber, Personalize response, Please enter the INTERNAL extension assigned., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
InputBox, externalnumber, Personalize response, Please enter the EXTERNAL number assigned., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
else
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello %Username%,
Send {Enter 2}
SendRaw, We have created a phone extension for your account. Below is the account information:
Send {Enter 1}
SendRaw, Internal number: %insidenumber%
Send {Enter 1}
SendRaw, External Number: %externalnumber%
Send {Enter 1}
SendRaw, Voicemail Password: 8139
Send {Enter 3}
SendRaw, For assistance on how to use either a physical  phone or the software please see the following guide:
Send {Enter 2}
SendRaw, Article: <URL LINK TO ARTICLE>
Send {Enter 2}
Gosub, Ticket_End
return
