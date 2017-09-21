#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Last edit 8.8.17


;VPN

VPN_questions1:
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Template canceled
	Exit
}
SendRaw, Hello %Username%,
Send, {Enter 2}
SendRaw, Could you please let us know which type of token you would like for your account? We currently offer a SMS text option or a smartphone application. If you would like the SMS option, would you please let us know the cell number you would like to use? Alternatively, for the smartphone option we would need to know which phone model you currently have. Once we have this information we can go ahead and send out the instructions needed for setting up the account. If you have any questions please feel free to reach out to us via our Global Service Desk hotline:
Send, {Enter 3}
sleep, 50
GoSub, sdnumber
Send, {Enter 3}
sleep, 50
SendRaw, %CHARTER%
return




VPN_Closing_TXT:
SendRaw, A VPN account has been issued for your account. If you have selected to use the smartphone application you will need to open the signify email you will be receiving on your mobile device then follow all the instructions listed. After activating the mobile application, please make sure to follow the steps to login back into the account to finish setup. If you were set up with the SMS code simply follow the steps on your computer to complete the setup.
Send {Enter 2}
Gosub, Ticket_End
Return

VPN_pins_reset:
InputBox, Username, Personalize response, Please enter caller name., , 300, 160
if (ErrorLevel > 0){
	MsgBox, Transfer template canceled
	Exit
}
vpnv1 =
(
Hello %Username%,

It appears you may need to reset your pin. To reset your pin, please follow the KB article below:

[code]<a href="https://arm.service-now.com/kb_view.do?sysparm_article=KB0012922" target="_blank" style="color:blue">KB0012922</a>[/code]:  How to: Reset PIN for Signify

After resetting your pin please go ahead and try to login to the pulse client again. As a reminder in the pulse client the username will be your ARM username. The password field will depend on which token you have. If you have the smartphone application then your password will be the number generated from the smartphone application. If you have the SMS or phsyical token option then your password will be your pin followed by the token code. For example, if your pin is abcde and the token or sms code is 123456 then your full password would be abcde123456.
)
SendRaw %vpnv1%
return
