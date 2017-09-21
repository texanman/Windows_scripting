echo off
cls

ECHO.
ECHO ...............................................
ECHO SELECT YOUR ADMIN TASK
ECHO ...............................................
ECHO.
ECHO 1 - Active Directory
ECHO 2 - Dhcp
ECHO 3 - DNS
ECHO 4 - EXIT
ECHO.

choice /C 1234 
goto menu%errorlevel%



:menu1
C:\Windows\System32\runas.exe /user:domain\username "cmd /c  start %SystemRoot%\system32\dsa.msc"
GOTO:EOF

:menu2
C:\Windows\System32\runas.exe /user:domain\username "cmd /c start %SystemRoot%\system32\dhcpmgmt.msc"
GOTO:EOF

:menu3
C:\Windows\System32\runas.exe /user:domain\username "cmd /c start %SystemRoot%\system32\dnsmgmt.msc /s"
GOTO:EOF

:menu4
GOTO:EOF





