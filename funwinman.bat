@echo off
SETLOCAL

:: Author: Joshua Fox
set version=0.3.3

:: Check for admin and nag if permissions missing
net session >nul 2>&1
if %errorLevel% == 0 (goto :MAINMENU) else (goto :ADMINNAG)

:: Main Menu.  Invlid input should keep you here for a long time!
:MAINMENU
cls
more .\bin\messages\main_menu.txt

set /P menuchoice=What menu item would you like?: 
	if /I "%menuchoice%" EQU "" (goto :MENUERROR)
	if /I "%menuchoice%" EQU "help" (goto :SELECTHELP)
    if /I "%menuchoice%" EQU "cmd" (goto :SELECTCMD)
	if /I "%menuchoice%" EQU "navi" (goto :SELECTNAVI)
	if /I "%menuchoice%" EQU "config" (goto :SELECTCONFIG)
	if /I "%menuchoice%" EQU "trouble" (goto :SELECTTROUBLE)
    if /I "%menuchoice%" EQU "program" (goto :SELECTPROGRAM)
	if /I "%menuchoice%" EQU "quit" (goto :SELECTQUIT) else (goto :MENUERROR)

::Menu Item Actions
:SELECTHELP
more .\bin\messages\help.txt
echo version %version%
pause
goto :MAINMENU

:SELECTCMD
start cmd.exe /k echo This is a real cmd shell -- use with caution!  Type exit to quit.
goto :MAINMENU

:SELECTNAVI
call .\bin\navi\navi.bat
goto :MAINMENU

:SELECTCONFIG
call .\bin\config\config.bat
goto :MAINMENU

:SELECTTROUBLE
call .\bin\trouble\trouble.bat
goto :MAINMENU

:SELECTPROGRAM
call .\bin\program\program.bat
goto :MAINMENU

:SELECTQUIT
goto: eof

::Errors and Nags
:MENUERROR
echo That isn't a valid menu item. Hint: type the item name in brackets.
pause
goto :MAINMENU

:ADMINNAG
more .\messages\admin_missing.txt
pause
goto :MAINMENU