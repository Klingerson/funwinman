@echo off
SETLOCAL

:: Author: Joshua Fox
:: program.bat version 1.0

:: Main Menu.  Invlid input should keep you here for a long time!
:MAINMENU
cls
more .\bin\messages\program.txt

set /P menuchoice=What menu item would you like?: 
	if /I "%menuchoice%" EQU "" (goto :MENUERROR)
    if /I "%menuchoice%" EQU "back" (goto :SELECTBACK)
	if /I "%menuchoice%" EQU "echo" (goto :SELECTECHO)
	if /I "%menuchoice%" EQU "???" (goto :SELECT???) else goto :MENUERROR

::Menu Item Actions
:SELECTBACK
goto :eof

:SELECTECHO
echo this is just a placeholder... needs work!
pause
goto :MAINMENU

:SELECT???
echo this is just a placeholder... needs work!
ipconfig /all | more
pause
arp -a
pause
goto :MAINMENU

::Errors and Nags
:MENUERROR
echo That isn't a valid menu item. Hint: type the item name in brackets.
pause
goto :MAINMENU