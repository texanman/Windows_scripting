; -----------------------------------------------------------------------------------------------------------------------
; 
; v2.2
; -----------------------------------------------------------------------------------------------------------------------
; Creates a text file in your documents folder that is used as a reference in the macros

InputBox, NAME, Personalize response, Please enter your full name. (ex. John Doe), , 300, 160
InputBox, USRNAME, Personalize response, Please enter your username. (ex. loginname), , 300, 160
InputBox, DOMAIN, Personalize response, Please enter your domain. (ex. main.com), , 300, 160
InputBox, INNUM, Personalize response, Please enter your internal extension. (ex. 12345), , 300, 160
InputBox, EXNUM, Personalize response, Please enter your full external extension. (ex. +1 123 123 1234 or +1-123-123-1234), , 300, 160

FileAppend, [SdInfo] `n, %A_MyDocuments%\sd_macro_config.ini
FileAppend, [SCRIPTSET] `n, %A_MyDocuments%\sd_macro_config.ini
FileAppend, [CUSTOM] `n, %A_MyDocuments%\sd_macro_config.ini


IniWrite, %NAME%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Name ; writes  Name to config file
IniWrite, %USRNAME%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, UsrName ; writes Username to config file
IniWrite, %DOMAIN%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Domain ; writes Domain to config file
IniWrite, %INNUM%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, InNumber ; writes Internal # to config file
IniWrite, %EXNUM%, %A_MyDocuments%\sd_macro_config.ini, SdInfo, ExNumber ; writes External # to config file
IniWrite, 1b, %A_MyDocuments%\sd_macro_config.ini, SdInfo, Version ; writes version number to config file

MsgBox, Custom settings reset!  -  If at any time the macro script is not entering your name correctly please rerun SETUP.BAT. Then restart the main macro script.
return