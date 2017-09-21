#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Last edit 8.17.17

clipboardmgrcopy:
clpbold = %Clipboard% ; restores default clipboard value 
Clipboard =    ; This erases the clipboard, so that we can be sure something new is added in the next step.
Send, ^c    ; Add the highlighted text to the clipboard
ClipWait, 60    ; Give Windows time to actually populate the clipboard - you may need to experiment with the time here.
if Clipboard = ""
{
	; it's a picture, file etc.
	return
}
if Clipboard contains %clpb1%,%clpb2%,%clpb3%,%clpb4%,%clpb5%
{
	; already exists, stay in slot 1
}
else {
Clipboard = %Clipboard%   ; Edits the clipboard contents, without needing extra variables (unlike the original script).
; new content
	clpb5 := clpb4
	clpb4 := clpb3
	clpb3 := clpb2
	clpb2 := clpb1
	clpb1 := Clipboard
	}
Clipboard = %clpbold%
ClipWait, 60
tooltip, 1: %clpb1%`n2: %clpb2%`n3: %clpb3%`n4: %clpb4%`n5: %clpb5%
sleep 1000
tooltip
return

clipboardmgrv:
tooltip, 1: %clpb1%`n2: %clpb2%`n3: %clpb3%`n4: %clpb4%`n5: %clpb5%
sleep 1500
tooltip
return


clipboardmgr1:
Clipboard = %clpb1%
Send, ^v
return

clipboardmgr2:
Clipboard = %clpb2%
Send, ^v
return

clipboardmgr3:
Clipboard = %clpb3%
Send, ^v
return

clipboardmgr4:
Clipboard = %clpb4%
Send, ^v
return

clipboardmgr5:
Clipboard = %clpb5%
Send, ^v
return

clipboardmgrprocess:
Gui, clip:Submit
if (Clipboardmangerchk = "0"){
	IniWrite, 0, %A_MyDocuments%\sd_macro_config.ini, CUSTOM, Clipboardmanger
	Hotkey, !c, clipboardmgrcopy, off
	Hotkey, !v, clipboardmgrv, off
	Hotkey, !1, clipboardmgr1, off
	Hotkey, !2, clipboardmgr2, off
	Hotkey, !3, clipboardmgr3, off
	Hotkey, !4, clipboardmgr4, off
	Hotkey, !5, clipboardmgr5, off
	}
	
if (Clipboardmangerchk = "1"){
	IniWrite, 1, %A_MyDocuments%\sd_macro_config.ini, CUSTOM, Clipboardmanger
	Hotkey, !c, clipboardmgrcopy, on
	Hotkey, !v, clipboardmgrv, on
	Hotkey, !1, clipboardmgr1, on
	Hotkey, !2, clipboardmgr2, on
	Hotkey, !3, clipboardmgr3, on
	Hotkey, !4, clipboardmgr4, on
	Hotkey, !5, clipboardmgr5, on
	}
Gui, clip:Destroy
return



clipboardmgr_help:
MsgBox, , Help,  To use the clipboard manager please see the trigger keys below. As you copy items to the managed clipboard you will see a small list of what currently is entered next to your on-screen mouse. To paste an entry use the listed trigger. You can have a max of 5 managed entries. The manager also will block attempts at copying the same highlighted text (for example if you copied the word "THE" then later copied the word again it will not overwrite any listed entries)`n`nTrigger keys:`n`nAlt + C = copies highlighted text to manager`nAlt + V= View what is currently managed by the clipboard manager`nAlt + 1-5 = Paste the saved item
return




