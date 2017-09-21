;--------------------------------------------------------------------
; Misc code blocks that do not have any real catagory
;--------------------------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; -- OTHER --

sdnumber:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Internal number: XXXXXX
Send {Enter 2}
SendRaw, External numbers:
Send {Enter 1}
SendRaw, USA: +X-XXX-XXXX
Send {Enter 1}
SendRaw, International: +X-XXX-XXXX
Send {Enter 1}
BlockInput, off ; turns off prevention from accidential typing while script is running
return




; Shortcuts
listshortcuts:
msgbox, ctrl + alt + 4  =  inserts a £ or $ symbol depending on region`n
return

!^4::
if (DOMAIN = "domain.host.com" or DOMAIN = "domain") {
	send $
	return
	}
else{
	send £
	return
	}
return