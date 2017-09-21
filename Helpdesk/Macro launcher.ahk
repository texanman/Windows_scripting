; -----------------------------------------------------------------------------------------------------------------------
; Main script - This file should be the only one running to launch all the listed scripts.
;
;
;
; -----------------------------------------------------------------------------------------------------------------------
#Persistent ; This tells the script to not close if told to exit, Keeps it running in the background
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability. Sets input mode
#SingleInstance Force ; Forces only one copy to run


; -------------------  Script actual start  ------------------------;

;Read user config from .ini file in local my documents folder
version := "X" ; <---- Current version number of script, used to appear in menu system and used for updating
IniRead, SDNAME, %A_MyDocuments%\macro_config.ini, SdInfo, Name  ; --- CAN use any name for this file. Just edit the creation script.
IniRead, USRNAME, %A_MyDocuments%\macro_config.ini, SdInfo, UsrName  ; ---
IniRead, DOMAIN, %A_MyDocuments%\macro_config.ini, SdInfo, Domain  ;	Please make sure to add any lines here to the misconfigured check (ctrl +f)
IniRead, INNUMBER, %A_MyDocuments%\macro_config.ini, SdInfo, InNumber  ; --- ^^
IniRead, EXNUMBER, %A_MyDocuments%\macro_config.ini, SdInfo, ExNumber  ; --- ^^
;CUSTOM settings 
IniRead, CUSTOMTRIGGER, %A_MyDocuments%\macro_config.ini, CUSTOM, CustomTrigger ; -- reads a custom trigger if set
IniRead, CLIPBOARDMANAGER, %A_MyDocuments%\macro_config.ini, CUSTOM, Clipboardmanger ; -- enable/disable clipboard manager

; -- STATIC VARIABLES -- ;
SDLEADS = <MANAGERS/SUPERVISOR EMAIL HERE> ; -- Used for emailing supervisior or manager with a few different esclations based on scripts
SCRIPTSUPPORT = <EMAIL OF SCRIPT SUPPORT> ; -- Used for emailing the team who supports or manages these scripts


; -- Options menu sets -- ;
if CUSTOMTRIGGER not contains ERROR 
	If (CUSTOMTRIGGER){
	Hotkey, %CUSTOMTRIGGER%, launchmenu, on ; Sets custom launch trigger
	}

if (CLIPBOARDMANAGER){
	Clipboardmangerchk = %CLIPBOARDMANAGER%
	Gosub, clipboardmgrprocess
	}


; -AUTO UPDATE every 1 hour- ;	
SetTimer, autoupdate , 3600000, 0




	
	


; --- Menu system --- ;

; These titles and menus can be renamed to anything depending on what your needs are. 



; - Triage menu -
; -- examples of level 1 questions that can be asked

Menu, triagemenu, Add, Opening, Opening_TXT
Menu, triagemenu, Add, Reminder, Reminder_TXT
Menu, triagemenu, Add, Waiting vendor response, Waiting_3rd_party_TXT
Menu, triagemenu, Add, Transfering, Transfering_TXT
Menu, triagemenu, Add, Ticket closing, Ticket_End

; - Basic troubleshooting main -
Menu, troubleshooting-submenu, Add, Opening questions, Basic_Questions_TXT
Menu, troubleshooting-submenu, Add, Phone Number, deptnumber
Menu, troubleshooting-submenu, Add
Menu, troubleshooting-submenu, Add, Triage reminder, Triage_checklist
; - Specialized troubleshooting main -




; -- Linux and cluster --


; Hosted applications > Confluence
Menu, confluence-sub, Add, Hosted app question, hostedapps-txt

; Hosted apps menu
Menu, hosted-apps-sub, Add, Hosted app 1, :hosted-apps-sub


; Linux and cluster > Home and Data
Menu, linux-data-submenu, Add, Directory created, HOMEDIR_Closing_TXT
Menu, linux-data-submenu, Add, Questions, HOMEDIR_Question_TXT
; --- Linux and cluster main sub menu --- ;
Menu, linux-cluster-submenu, Add, Home and Data Directories, :linux-data-submenu

; -- VPN -- ; Can be anything below
Menu, vpn-submenu, Add, Account creation, VPN_Closing
Menu, vpn-submenu, Add, Account Questions, VPN_questions1
Menu, vpn-submenu, Add, Reset, VPN_reset


; -- Shoretel -- ; Can be anything below
Menu, shoretel-submenu, Add, Account creation, Shoretel_creation_closing_TXT

; -- Windows --;
; -- Forced updates --
Menu, winupdate-software, Add, Critical updates, critupdate_text
Menu, winupdate-software, Add, Regular "forced" updates, regupdate_text


; -- Windows Main menu -- ;
Menu, windows-submenu, Add, Updates and software installs, :winupdate-software

; --- Specialized Main menu --- ; Examples that can be used for more advanced quick menus
Menu, adv-submenu, Add, Hosted applications, :hosted-apps-sub
Menu, adv-submenu, Add, Linux and Cluster, :linux-cluster-submenu
Menu, adv-submenu, Add, Shoretel, :shoretel-submenu
Menu, adv-submenu, Add, VPN, :vpn-submenu
Menu, adv-submenu, Add, Windows, :windows-submenu

; Specialized troubleshooting menu end --

; -- Admin menu -- ; Optional section to add shortcuts to common IT staff apps
Menu, adminmenu, Add, Active Directory, AD_Launch ; quick menu to assist staff to open AD
Menu, adminmenu, Add, DHCP, AD_Launch, DHCP_Launch ; quick menu to assist staff to open DHCP	
Menu, adminmenu, Add, DNS, DNS_Launch ; quick menu to assist staff to open DNS


; ---- Information quicklist start ---- ;


; - Most used knowledge - ;  This section can be used for articles to share with your caller/user base
Menu, kb-used, Add, How to use VPN, knowledge1
Menu, kb-used, Add, Creating Passwords, knowledge2
Menu, kb-used, Add, Kerberize IOS/linux browser, knowledge3
Menu, kb-used, Add, What is your hostname?, knowledge4

; - Triage article links - ; These can be used to web link various knowledge articles for IT internal use
Menu, kb-triage, Add, Item name 1, article1


; - Ticket system quicklinks - ; This section can be used to call API's on your system. 

Menu, ticketlink, Add, Software catalog, softcatalog
Menu, ticketlink, Add, Knowledge homepage, knowledgecatalog


; - main info quicklist menu - ;
Menu, kb-SubMenu, Add, Knowledge Search, KB_Search
Menu, kb-SubMenu, Add 
Menu, kb-SubMenu, Add, Most used articles, :kb-used
Menu, kb-SubMenu, Add, Triage article links, :kb-triage
Menu, kb-SubMenu, Add, Ticketsystem Quicklinks, :ticketlink



; -- Software Installs
Menu, softwaremenu, Add, Camtasia Studio, Camtasia_TXT
Menu, softwaremenu, Add, JetBrains, JetBrains_TXT
Menu, softwaremenu, Add, OmniGraffle Pro, OmniGraffle_TXT
Menu, softwaremenu, Add, ShoreTel, ShoreTel_s_TXT
Menu, softwaremenu, Add, Visual Studio Pro, VisualStudio_PRO_TXT
Menu, softwaremenu, Add, Visio, Visio_TXT

; --- ServiceNow Formatting/Shortcuts ---;
Menu, SNOW-submenu, Add, Insert URL, SnowUrl



; ----- Main Main Menu ----- ;
; This creates the first default menu when the menu is launched ; Once again can be anything
Menu, FullMenu, Add, Triage, :triagemenu
Menu, FullMenu, Add, Basic Troubleshooting, :troubleshooting-submenu
Menu, FullMenu, Add, Specialized Closings or Questions, :adv-submenu
Menu, FullMenu, Add, Information Quicklist, :kb-SubMenu
Menu, FullMenu, Add, Software Installs, :softwaremenu
Menu, FullMenu, Add, ServiceNow Formatting/Shortcuts, :SNOW-submenu

;options menu
Menu, FullMenu, Add ;blank
Menu, FullMenu, Add, Administrative shortcuts, :adminmenu
Menu, FullMenu, Add, ----------, Dummy_TXT
Menu, FullMenu, Disable, ----------, ; Blanks out ----------, number
Menu, FullMenu, Add, Settings, settings_set ; launches the settings gui
Menu, FullMenu, Add 
Menu, FullMenu, Add, Submit Feedback, Feedback_email
Menu, FullMenu, Icon, Submit Feedback, %A_ScriptDir%\Data-folder\settings\email.ico ; adds in an icon
;Version #
Menu, FullMenu, Add ;blank
Menu, FullMenu, Add, Version %version%, Dummy_TXT
Menu, FullMenu, Disable, Version %version% ; Blanks out version number


;-- Default Tray --;  This is the tray icon ;
Menu, Tray, NoStandard ; disables the default options in the tray icon
Menu, Tray, Icon, %A_ScriptDir%\Data-folder\settings\icon.ico, 1 ; optional, allows you to set a default icon
Menu, Tray, add, Service Desk Scripts, settings_set ; This is a custom options menu created with a gui
Menu, Tray, Disable, Service Desk Scripts ; allows a title to be added then grayed out
Menu, Tray, add, Version %version%, Dummy_TXT
Menu, Tray, Disable, Version %version% ; allows a title to be added then grayed out, lists version number 
Menu, Tray, add, Settings, settings_set
Menu, Tray, Default, Service Desk Scripts ; sets a default double click action on the tray icon
Menu, Tray, Add, Quit, quitscript ; Adds a quit option from the tray menu

return ; ends the menu section



; -------------  Macro menu trigger ------------- ;
^q:: ; control + q
Gosub, launchmenu ; Launches the menu
return


; -------------  Macro menu  ------------- ;

launchmenu:

If !FileExist(A_MyDocuments "\macro_config.ini"){ ; this checks to see if the person has a config file in their documents directory
MsgBox, 16, ERROR!, Config file missing. Please run SETUP.BAT to generate configuration file.,
exit
}
else{
	IniRead, VERSIONNUM, %A_MyDocuments%\macro_config.ini, SCRIPTSET, Version ; Reads version number from config.ini
	If (VERSIONNUM != "X"){ ; < ----- Checks VERSION number of configuration file vs agents current config -  *Change this when needing to add new items to config.ini else script will crash*
		MsgBox, 16, ERROR! PLEASE READ!, Configuration file requires new settings do to recent changes. Please rerun SETUP.BAT and generate a new config. If you have not read the instuctions now would be a good time.,
		exit
	}
	;---- MISCONFIGURED CHECK ---
	If (!SDNAME or !USRNAME or USRNAME = "ERROR" or !DOMAIN or !INNUMBER or !EXNUMBER){ ; < ---- checks for if user entered in any data incorrectly or left it blank, Please edit this line if adding new options to config
		MsgBox, 16, ERROR! PLEASE READ!, Configuration file is misconfigured or contains invalid data and is producing an error. Please rerun the SETUP.bat and please be sure to fill in every box with the correct information.`n`nIf you have not read the instuctions now would be a good time.,
		exit
	}
	else{ ; logs date and who is using the script. Will write to Data-folder\logging\usage-guide.username.month.file every time someone launches the script. Only works if script is being used correctly as per instructions. Use notepad to view logs.
		FormatTime, TimeString,,dd/MM/yyyy ; format timestamp to var
		FormatTime, fileDate,,MM ; format timestamp to 2nd var
		FileAppend, %UsrName% %TimeString%`n, Data-folder\logging\usage-guide.%USRNAME%.%fileDate%.file ; writes username to file based on date, can rename  base file
		Menu, FullMenu, Show ; launch the main menu
	}
}
return


Dummy_TXT: ; dummy script. Does nothing but required for some functions
return



quitscript: ; for exiting the guis
ExitApp

;--functions--;
;Email variables and functions <----- Used for sending emails from other hotkeys
; ENTER key = `%0D`%0A  <---- Code for placing new lines in body of email
Send_email(TO, SUBJECT, BODY1){ ; -- this function allows an email to be sent using outlook 2016. Can be edited for previous versions
outlook := "C:\Program Files (x86)\Microsoft Office"
run %comspec% /c ""%outlook%\root\Office16\OUTLOOK.EXE" /c ipm.note /m "%TO%&subject=%SUBJECT%&body=%BODY1%""
return sent
}
; list files from directory function
list_files(Directory, name) ; function for reading files/folders in a directory. Can be used in custom sections
{
	files =
	Loop %Directory%\%name%
	{
		files = %files%`n%A_LoopFileName%
	}
	return files
}

Feedback_email: ; <--- Send feedback email in main menu. If anyone has ideas allows them to send an email to the scripts maintainer
Send_email(ByRef SCRIPTSUPPORT, "Macro script Feedback", "Section and sub-sections for feedback:%0D%0A%0D%0AComments:")
return

autoupdate: ; < -- script used to update any changes on the fly. timer at the top can be used to set when this script refreshes.
StringSplit, curversion, % list_files(A_ScriptDir, "\current*.*"), %A_Space%, v
If (curversion4 = version) {
	return
}
else{
reload
return
}
	

; -- actual macros --
; -- files are split up to ensure speed as well to make things easier to edit. Keep this section at the end else bad things happen. To add new file follow the lead of an existing one.








; -- TRIAGE MACROS section -- ;
#Include %A_ScriptDir%\Data-folder\triage.ahk
; -- Basic Troubleshooting -- ;
#Include %A_ScriptDir%\Data-folder\basic_troubleshooting.ahk
; -- Specialized Troubleshooting and questions -- ;
#Include %A_ScriptDir%\Data-folder\adv_troubleshooting\linux.ahk
#Include %A_ScriptDir%\Data-folder\adv_troubleshooting\phones.ahk
#Include %A_ScriptDir%\Data-folder\adv_troubleshooting\vpn.ahk
#Include %A_ScriptDir%\Data-folder\adv_troubleshooting\windows.ahk
#Include %A_ScriptDir%\Data-folder\adv_troubleshooting\hostedapps.ahk
; -- Administrative Commands -- ;
#Include %A_ScriptDir%\Data-folder\admin_commands.ahk
; -- Other -- ;
#Include %A_ScriptDir%\Data-folder\other.ahk
; -- KB Quicklist -- ;
#Include %A_ScriptDir%\Data-folder\info_quicklist.ahk
; -- Software Installs -- ;
#Include %A_ScriptDir%\Data-folder\software_installs.ahk
; -- ServiceNow formatting -- ;
#Include %A_ScriptDir%\Data-folder\web_formatting.ahk
; -- Options Gui + Options -- ;
#Include %A_ScriptDir%\Data-folder\settings\options.ahk
#Include %A_ScriptDir%\Data-folder\settings\clipboard-manager.ahk
#Include %A_ScriptDir%\Data-folder\settings\triggers.ahk
#Include %A_ScriptDir%\Data-folder\settings\personal_edit.ahk


