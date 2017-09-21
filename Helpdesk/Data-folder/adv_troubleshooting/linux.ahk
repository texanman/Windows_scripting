#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Last edit 8.8.17

; --- Linux questions --- ;



;Home Directories

HOMEDIR_Question_TXT:
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Transfer template canceled
	Exit
}
else
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello %Username%,
Send {Enter 2}
SendRaw, We have a few questions to ask in order to get the account created:
Send {Enter 2}
SendRaw, - What linux machines will you be needing a  directory on?
Send {Enter 1}

Return

HOMEDIR_Closing_TXT:
SendRaw, A  directory has been made on the requested clusters. 
Send {Enter 2}
Gosub, Ticket_End
return
