#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Last edit 8.8.17

; SOFTWARE INSTALLs


Camtasia_TXT:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello,
Send {Enter 1}
SendRaw, You should now be able to install the software. It can be downloaded from the following: 
Send {Enter 2}
SendRaw, Windows:
Send {Enter}
SendRaw, URL
Send {Enter 2}
SendRaw, Mac: 
Send {Enter 1}
SendRaw, URL
Send {Enter 2}
SendRaw, Or 
Send {Enter 1}
SendRaw, URL
Send {Enter 2} 
SendRaw, license key: -
Send {Enter 3}
SendRaw, If you have any trouble with the installation please open a ticket with IT and we will be happy to assist.
BlockInput, off ; turns off prevention from accidential typing while script is running
Gosub, Ticket_End
return

JetBrains_TXT:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello,
Send {Enter 1}
SendRaw, I have attached your JetBrains license file to this ticket. It contains all you need to get it installed. It is available for download from: URL
BlockInput, off ; turns off prevention from accidential typing while script is running
Gosub, Ticket_End
return

OmniGraffle_TXT:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello,
Send {Enter 1}
SendRaw, To install OmniGraffle Pro , please go to URL and install the version for your OS. Once installed please provide the license information located below: 
Send {Enter 2}
SendRaw, License Owner:
Send {Enter 1}
SendRaw, License Key: -
Send {Enter 3}
BlockInput, off ; turns off prevention from accidential typing while script is running
GoSub, Ticket_End
return

ShoreTel_s_TXT:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello,
Send {Enter 2}
SendRaw, Your account has been enabled for software phone use. You should also be able to install the  software from the Software Center if on Windows or the portal on a Mac. 
BlockInput, off ; turns off prevention from accidential typing while script is running
GoSub, Ticket_End
return

VisualStudio_PRO_TXT:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello,
Send {Enter 2}
SendRaw, I have attached the installer for Visual Studio Pro . This will download and install the application and you should be able to use the license key below to activate: 
Send {Enter 2}
SendRaw, License: -
Send {Enter 2}
BlockInput, off ; turns off prevention from accidential typing while script is running
GoSub, Ticket_End
return

Visio_TXT:
BlockInput, on ; turns on prevention from accidential typing while script is running
SendRaw, Hello,
Send {Enter 2}
SendRaw, You should now have access to install Visio . If you are running Windows please click the start button and search for Software Center. In the Software Center you can search for Visio, click on it and click Install. 
BlockInput, off ; turns off prevention from accidential typing while script is running
GoSub, Ticket_End
return

