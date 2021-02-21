@echo off
set RAMD=
set CDROM=

echo.
echo Preparing to start your computer.
echo This may take a few minutes. Please wait...
echo.

findramd

if errorlevel 255 goto no_ramdrive

if not errorlevel 3 goto no_ramdrive

goto do_shift

:loop
if errorlevel %1 goto no_shift

:do_shift
set cdrom=%2
shift
shift
if not %1*==* goto loop
goto no_ramdrive

:no_shift
set ramd=%2

if "%RAMD%"=="C" goto c_drive

goto success

:c_drive
echo Windows 98 has detected that drive C does not contain a valid FAT or
echo FAT32 partition. There are several possible causes.
echo.
echo 1.  The drive may need to be partitioned. To create a partition on the drive, 
echo run FDISK from the MS-DOS command prompt. 
echo.
echo 2.  You may be using third-party disk-partitioning software. If you are using 
echo this type of software, remove the Emergency Boot Disk and restart your 
echo computer. Then, follow the on-screen instructions to start your computer from 
echo a floppy disk.
echo .
echo 3.  Some viruses also cause your drive C to not register. You can use a virus 
echo scanning program to check your computer for viruses.
echo.
goto success

:no_ramdrive
echo The Windows 98 startup disk could not create a temporary drive for the 
echo diagnostic tools. This may be because this computer has less than the  
echo minimum required extended memory.  
echo.
:success
