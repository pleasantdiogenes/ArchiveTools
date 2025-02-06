@echo off
setlocal

rem Run the VBScript pop-up window
for /f "tokens=1,2 delims=|" %%A in ('cscript //nologo popup.vbs') do (
    set "drive_letter=%%A"
    set "filename=%%B"
)

rem Ensure drive letter and filename are set
if "%drive_letter%" == "" (
    echo Drive letter not provided. Exiting.
    exit /b
)
if "%filename%" == "" (
    echo Filename not provided. Exiting.
    exit /b
)

echo Drive letter: %drive_letter%
echo Filename: %filename%

rem Define a function to search and delete files with a given filename on a specified drive
:DeleteFiles
rem Navigate to the drive
pushd "%drive_letter%" || (
    echo Directory "%drive_letter%" not found.
    exit /b
)

rem Search for and delete files with the specified name in all directories
for /r %%D in (*) do (
    if /i "%%~nxD"=="%filename%" (
        echo Deleting "%%~fD"...
        del "%%~fD" /q
    )
)

rem Recursively search subdirectories
for /d %%D in (*) do (
    pushd "%%D"
    goto :DeleteFiles
)

rem Return to the original directory
popd

echo Deletion complete.
pause
