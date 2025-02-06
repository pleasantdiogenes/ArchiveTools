@echo off
setlocal enabledelayedexpansion

rem Set color variables
set "color_title=0A"  REM Bright Green
set "color_prompt=0E" REM Yellow
set "color_message=0F" REM White
set "color_input=0B"   REM Bright Cyan
set "color_warning=0C" REM Bright Red

rem Set console color scheme
color %color_title%

rem Display title
echo.
echo ============================
echo === File Deletion Script ===
echo ============================
echo.

rem Reset color scheme
color

rem Prompt the user to enter the drive letter
color %color_prompt%
set /p drive_letter=Enter the drive letter (e.g., C:): 
color

rem Prompt the user to enter the filename
color %color_prompt%
set /p filename=Enter the filename to search for: 
color

rem Define a function to search and delete files with a given filename on a specified drive
:DeleteFiles

rem Check if the specified drive letter exists
if not exist "%drive_letter%\" (
    color %color_warning%
    echo Drive "%drive_letter%" not found.
    exit /b
)

rem Search for and delete files with the specified name in all directories
for /f "delims=" %%F in ('dir /s /b "%drive_letter%\%filename%" 2^>nul') do (
    if exist "%%F" (
        color %color_message%
        echo Deleting "%%F"...
        del "%%F" /q
    ) else (
        color %color_warning%
        echo File "%%F" not found.
    )
)

echo.
color %color_message%
echo Deletion complete.
pause
exit /b