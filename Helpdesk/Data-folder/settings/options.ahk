#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; Last edit 8.17.17


; --- Main settings menu gui --- ;
settings_menu:
Gui Add, GroupBox, x10 y15 w240 h110, Trigger Settings
Gui Add, Button, gtrigger_menu x30 y40 w200 h30, Set Custom Trigger
Gui Add, Button, gpersonal_settings_edit x30 y80 w200 h30, Edit Personal Settings
Gui Add, GroupBox, x10 y145 w240 h110, Text Management
Gui Add, Button, gclipmanager_menu x30 y170 w200 h30, Clipboard Manager
Gui Add, GroupBox, x10 y275 w240 h110, Other Settings
Gui Add, Button, gsoonmsg x30 y300 w200 h30, Additional Shortcuts
Gui Add, Button, gupdatescript x30 y340 w200 h30, Auto-Update script


Gui Show,, Options Menu
Return

personal_settings_edit:
IniRead, SDNAMEi, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Name  ; ---
IniRead, USRNAMEi, %A_MyDocuments%\sd_macro_config.ini, SdInfo, UsrName  ; ---
IniRead, DOMAINi, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Domain  ;	
IniRead, INNUMBERi, %A_MyDocuments%\sd_macro_config.ini, SdInfo, InNumber  ; --- ^^
IniRead, EXNUMBERi, %A_MyDocuments%\sd_macro_config.ini, SdInfo, ExNumber  ; --- ^^


Gui pset:Add, Edit, vSDNAMEe x120 y32 w150 h21, %SDNAMEi%
Gui pset:Add, Edit, vUSRNAMEe x120 y72 w150 h21, %USRNAMEi%
Gui pset:Add, Edit, vDOMAINe x120 y112 w150 h21, %DOMAINi%
Gui pset:Add, Edit, vINNUMBERe x120 y152 w150 h21, %INNUMBERi%
Gui pset:Add, Edit, vEXNUMBERe x120 y192 w150 h21, %EXNUMBERi%
Gui pset:Add, Text, x16 y32 w90 h23 +0x200, Full Name =
Gui pset:Add, Text, x16 y72 w94 h23 +0x200, User Name =
Gui pset:Add, Text, x16 y112 w97 h23 +0x200, Full Domain =
Gui pset:Add, Text, x16 y152 w88 h23 +0x200, Internal # =
Gui pset:Add, Text, x16 y192 w88 h23 +0x200, External # =
Gui pset:Add, Button, gsubmit_p_edit x16 y232 w120 h41, Save Changes
Gui pset:Add, Button, gkillpset x144 y232 w120 h41, Cancel

Gui pset:Show, w278 h281, Personal Settings
Return



; -- Trigger settings menu -- ;
trigger_menu:
IniRead, CUSTOMTRIGGER, %A_MyDocuments%\sd_macro_config.ini, CUSTOM, CustomTrigger
Gui trig:Add, Edit, x279 y56 w150 h20 vsettrigger ;v=variable
Gui trig:Add, Text, x144 y282 w105 h0, Text
Gui trig:Add, Text, x24 y56 w213 h35, Enter new custom trigger:
Gui trig:Add, Button, x16 y95 w120 h30 gsettrigger, Set  ; g=go to hotkey
Gui trig:Add, Button, x184 y95 w120 h30 gkilltrigger, Cancel
Gui trig:Add, Button, x344 y95 w120 h30 gtrigger_set_help, Help
Gui trig:Add, Text, x24 y8 w213 h33 +0x200, Currently set trigger:
Gui trig:Add, Text, x280 y7 w184 h36 +0x200, %CustomTrigger%

Gui trig:Show, w481 h135, Set Custom Trigger ; Shows gui
Return



updatescript:
msgbox The script will now close and update itself. Please wait about 5-10 seconds.
reload
return








; -- clipboard manager menu -- :
clipmanager_menu:
IniRead, CLIPBOARDMANAGER, %A_MyDocuments%\sd_macro_config.ini, CUSTOM, Clipboardmanger
if (CLIPBOARDMANAGER = "ERROR" or CLIPBOARDMANAGER = "" or CLIPBOARDMANAGER = "0" ){
	Clipboardmangerchk = 0
	varchecked = 0
	}
 if (CLIPBOARDMANAGER = "1"){
	Clipboardmangerchk = 1
	varchecked = 1
	}
Gui clip:Add, CheckBox, x24 y32 w216 h40 checked%varchecked% vClipboardmangerchk, Enable Clipboard Manager
Gui clip:Add, Button , x24 y96 w100 h35 gclipboardmgrprocess, OK
Gui clip:Add, Button, x144 y96 w100 h35 gclipboardmgr_help, Help
Gui clip:Show, w264 h149, Clipboard Manager
Return









; -- settings menu gui trigger -- ;
settings_set:
Gui, Destroy
Gui, trig:Destroy
Gui, clip:destroy
Gui, pset:Destroy
GoSub, settings_menu
return



; -- other settings -- ;

soonmsg:
MsgBox Feature coming soon!
return


; -- menu exit -- ;
GuiEscape:
GuiClose:
    Gui, Destroy
	return
	
	
	