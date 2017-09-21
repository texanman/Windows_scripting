;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------
;
;Service now formatting
;
;
;
; 
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------


; This section is required for every script written for the team macros
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors. <-- used for logging advanced tasks. Uncomment to use
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability. < -- sets input mode.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory. < -- this is only needed if this file does advanced file manupulation. Can leave commented out.




ticketUrl:
InputBox, URL1, tickets, Enter URL Link, , 300, 160
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
InputBox, URL2, tickets, Enter Text to show  , 300, 160
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
SendRaw, [code]<a href="%URL1%" target="_blank" style="color:blue">%URL2%</a>[/code]
return