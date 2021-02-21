@ECHO OFF
set EXPAND=YES
SET DIRCMD=/O:N
set LglDrv=27 * 26 Z 25 Y 24 X 23 W 22 V 21 U 20 T 19 S 18 R 17 Q 16 P 15
set LglDrv=%LglDrv% O 14 N 13 M 12 L 11 K 10 J 9 I 8 H 7 G 6 F 5 E 4 D 3 C
cls
call setramd.bat %LglDrv%
set temp=c:\
set tmp=c:\
path=%RAMD%:\;c:\;%CDROM%:\
copy command.com %RAMD%:\ > NUL
set comspec=%RAMD%:\command.com
copy extract.exe %RAMD%:\ > NUL
copy readme.txt %RAMD%:\ > NUL

:ERROR
IF EXIST ebd.cab GOTO EXT
echo Please insert Windows 98 Startup Disk 2
echo.
pause
GOTO ERROR

:EXT
%RAMD%:\extract /y /e /l %RAMD%: ebd.cab > NUL
echo The diagnostic tools were successfully loaded to drive %RAMD%.
echo.

IF "%config%"=="NOCD" GOTO QUIT
IF "%config%"=="HELP" GOTO HELP
LH %ramd%:\MSCDEX.EXE /D:mscd001 /L:%CDROM%
echo.
GOTO QUIT

:HELP
cls
call help.bat
echo Your computer will now restart and the startup menu will appear.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
restart.com
GOTO QUIT

:QUIT
echo To get help, type HELP and press ENTER.
echo.
rem clean up environment variables
set CDROM=
set LglDrv=
