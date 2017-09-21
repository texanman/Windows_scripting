#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; -- Basic troubleshooting macros

Basic_Questions_TXT:

SendRaw, We have a few questions to ask in order assist with troubleshooting. Could you provide us with the following information?
Send {Enter 2}
SendRaw, - What is your computer's hostname?
Send {Enter 1}
SendRaw, - Is this a windows, linux, or mac machine?
Send {Enter 1}
SendRaw, - Is this affecting anyone else besides yourself?
Send {Enter 1}
SendRaw, - When did this start occurring?
Send {Enter 1}
SendRaw, - Have you tried other web browsers?
Send {Enter 1}
SendRaw, - Have you restarted your machine since the problem occured?
Send {Enter 2}
SendRaw, In addition, could you please submit a screenshot of the error message or process that is broken?
Return
;

checklist: ; opens up your default browser to a site of your choosing
run, <URL link to a site>
return