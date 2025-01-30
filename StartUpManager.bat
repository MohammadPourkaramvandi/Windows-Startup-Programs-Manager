@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ============================================
echo Windows Startup Programs Manager
echo ============================================
echo.
echo 1. List Startup Programs
echo 2. Disable a Startup Program
echo 3. Exit
echo.
set /p choice=Please select an option (1-3): 

if "%choice%"=="1" goto list_programs
if "%choice%"=="2" goto disable_program
if "%choice%"=="3" exit

echo Invalid choice, please try again.
pause
goto menu

:list_programs
cls
echo ============================================
echo List of Startup Programs
echo ============================================
echo.

set count=0
for /f "tokens=2*" %%a in ('reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run') do (
    set /a count+=1
    echo !count!. %%b
)

for /f "tokens=2*" %%a in ('reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run') do (
    set /a count+=1
    echo !count!. %%b
)

if %count%==0 (
    echo No startup programs found.
) else (
    echo.
    echo Total startup programs: %count%
)

pause
goto menu

:disable_program
cls
echo ============================================
echo Disable a Startup Program
echo ============================================
echo.

set count=0
for /f "tokens=2*" %%a in ('reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run') do (
    set /a count+=1
    echo !count!. %%b
    set "program!count!=%%a"
    set "path!count!=%%b"
)

for /f "tokens=2*" %%a in ('reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run') do (
    set /a count+=1
    echo !count!. %%b
    set "program!count!=%%a"
    set "path!count!=%%b"
)

if %count%==0 (
    echo No startup programs found.
    pause
    goto menu
)

echo.
set /p program_num=Enter the number of the program you want to disable (1-%count%): 

if !program_num! lss 1 (
    echo Invalid selection.
    pause
    goto menu
)

if !program_num! gtr %count% (
    echo Invalid selection.
    pause
    goto menu
)

set "program_key=!program%program_num%!"
set "program_path=!path%program_num%!"

echo.
echo Are you sure you want to disable the following program?
echo !program_path!
echo.
set /p confirm=Type 'yes' to confirm: 

if /i "!confirm!" neq "yes" (
    echo Operation cancelled.
    pause
    goto menu
)

reg delete "!program_key!" /v "!program_path!" /f

if errorlevel 1 (
    echo Failed to disable the program.
) else (
    echo Program disabled successfully.
)

pause
goto menu