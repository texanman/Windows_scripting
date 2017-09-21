#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Last edit 8.8.17

; ADMINISTRATIVE commands

AD_Launch:
InputBox, password, Enter Password, (your input will be hidden), hide
if (ErrorLevel > 0){
	Exit
}
RunAs, %USRNAME%-adm, %password%, %DOMAIN%
RunWait %comspec% /c C:\Windows\System32\dsa.msc
RunAs
return

DHCP_Launch:
InputBox, password, Enter Password, (your input will be hidden), hide 
if (ErrorLevel > 0){
	Exit
}
RunAs, %USRNAME%-adm, %password%, %DOMAIN%
RunWait %comspec% /c C:\Windows\System32\dhcpmgmt.msc
RunAs
return

DNS_Launch:
InputBox, password, Enter Password, (your input will be hidden), hide 
if (ErrorLevel > 0){
	Exit
}
RunAs, %USRNAME%-adm, %password%, %DOMAIN%
RunWait %comspec% /c C:\Windows\System32\dnsmgmt.msc /s
RunAs
return