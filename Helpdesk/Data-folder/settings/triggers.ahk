#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; Last edit 8.17.17

settrigger:
Gui, trig:Submit ; sends temp vars into perm vars
IniRead, CUSTOMTRIGGER, %A_MyDocuments%\sd_macro_config.ini, CUSTOM, CustomTrigger
Hotkey,%CUSTOMTRIGGER%, launchmenu, off UseErrorLevel ; turns off pervious custom trigger
Hotkey, %settrigger%, launchmenu, on UseErrorLevel; sets new custom trigger
IniWrite, %settrigger%, %A_MyDocuments%\sd_macro_config.ini, CUSTOM, CustomTrigger ; writes custom trigger to config file
Gui, trig:Destroy ; removes menu
return

killtrigger:
Gui, trig:Destroy
return

trigger_set_help:
MsgBox, , Help, To set a custom trigger you will need to enter each key you want to press in one line. (Example.  !1 would mean ALT + 1 would trigger the menu. Example 2.  ^t would mean CTRL + t would be the menu trigger) `n`nBelow is a list of some special keys: `n^ = CTRL `n! = ALT `n# = WIN Key `n* = wildcard `n `nFor more information please see: autohotkey.com/docs/Hotkeys.htm
return