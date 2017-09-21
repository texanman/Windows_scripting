;------------------------------------------------
;Hosted app troubleshooting/request scripts
;
;v1.0
;
;------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



hostedapps-txt:
InputBox, conurl, New hosted space, Paste new hosted space URL,, 350, 125
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
context1=
(
The Space requested has been created at URL - %conurl%
 
We have added the users listed above as admins of this location to be able to manage permissions. 
Please refer to this page for more information on how to manage your application  permissions:
<URL LINK>


Kind regards,
%SDNAME%

)
Blockinput, on ; helps prevent unwanted edits
SendRaw, %context1%
Blockinput, off
return

