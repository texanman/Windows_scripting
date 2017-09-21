REM --- EDIT AS NEEDED --

REM ---- THIS SCRIPT FIRST CHECKS TO SEE IF YOU ARE A LOCAL ADMIN, IF NOT THEN IT WILL ASK FOR PERMISSIONS. THEN IT WILL PRESENT THE MENU BELOW.



:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo off
cls
Echo. 
ECHO. 
ECHO -------------------------------------
ECHO Please select an option:
ECHO -------------------------------------
ECHO. 
ECHO 1) Brand new user setup
ECHO 2) Create startup shortcut
ECHO 3) Reset personal configuration file (Minor personal config file changes can be done within the settings menu)
ECHO 4) Exit
ECHO. 
ECHO. 
ECHO. 
choice /C 1234
goto menu%errorlevel%


:menu4
exit

:menu3
Start "C:\Program Files\AutoHotkey\AutoHotkey.exe" Data-Folder/run-once.ahk
exit

:menu2
cls
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\main-macros.lnk');$s.TargetPath='main macros.ahk';$s.Save()"
start explorer.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
exit

:menu1
cls
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\main-macros.lnk');$s.TargetPath='main macros.ahk';$s.Save()"
cls
FOR /L %%i IN (1,1,5) DO (
	ECHO .....
	timeout /t 1 /nobreak > nul
)
ECHO Loading instuctions...
timeout /nobreak /t 2 > nul
goto INSTUCTIONS

:INSTUCTIONS
ECHO Please read all the instuctions before continuing. Then come back to this script.
ECHO Launching... 
timeout /nobreak /t 3 > nul
SET IE="C:\Program Files\Internet Explorer\iexplore.exe"
start <INSERT AGENT CUSTOM INSTUCTIONS HERE>
IF %ERRORLEVEL% == 0 (
	timeout /t 20
	echo|set /p="When finished - " 
	pause
	goto SYNC
)
else (
ECHO ERROR... PROBLEM WITH SCRIPT
pause
goto QUIT

:SYNC
CLS
ECHO Will pause here for you to sync over the Service Desk share if you have not already. DO NOT continue until this is done!!!
timeout /t 20
ECHO .
ECHO .
pause
goto FIRSTRUN

:FIRSTRUN
ECHO Loading First Run script. Press enter when done.
FOR /L %%i IN (1,1,5) DO (
	ECHO ......
	timeout /nobreak /t 1 > nul
)
Start /wait "C:\Program Files\AutoHotkey\AutoHotkey.exe" Data-Folder/run-once.ahk
IF %ERRORLEVEL% == 0 (
	timeout /nobreak /t 1 > nul
	pause
	goto SHORTCUT
)
else (
ECHO ERROR... PROBLEM WITH SCRIPT
pause
goto QUIT
)

:SHORTCUT
CLS
ECHO .
ECHO .
ECHO .
ECHO The startup folder should contain a team-macros.ahk file (will launch in a few seconds). This will ensure that the scripts are loaded when you first login to your machine. If this does not appear it means your account does not have admin access and as such please create this shortcut manually or rerun this script and select the second (2) option.  Press enter to continue.......
timeout /t 10 > nul
start explorer.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
FOR /L %%i IN (1,1,5) DO (
	ECHO ......
	timeout /nobreak /t 1 > nul
)
echo First run script complete.  Please start the main script...
pause
goto QUIT


:QUIT
exit