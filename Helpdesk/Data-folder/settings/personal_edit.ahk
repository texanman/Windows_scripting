;---------------------------------------------
; Personal settings edit gui scripts
;
; v1.0
; 
;---------------------------------------------


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force



submit_p_edit:
Gui, pset:Submit ; sends temp vars into perm vars
IniWrite, %SDNAMEe%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Name  ; ---
IniWrite, %USRNAMEe%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, UsrName  ; ---
IniWrite, %DOMAINe%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Domain  ;	
IniWrite, %INNUMBERe%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, InNumber  ; --- ^^
IniWrite, %EXNUMBERe%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, ExNumber  ; --- ^^

Gui, pset:Destroy ; removes menu
return

killpset:
Gui, pset:Destroy
return
