@echo off

REM Function to delete empty files on a specified drive
:delete_empty_files

REM Prompt the user to input the drive letter
set /p drive=Enter the drive letter (e.g., C:):

REM Check if drive is provided
if "%drive%"=="" (
    echo Drive letter not provided.
    pause
    exit /b 1
)

REM Check if drive exists
if not exist "%drive%\" (
    echo Drive %drive% does not exist.
    pause
    exit /b 1
)

REM Call the function to delete empty files
echo Deleting empty files on drive %drive%...
call :delete_empty_files_recursive "%drive%"
echo All empty files on drive %drive% have been deleted.
pause
exit /b

:delete_empty_files_recursive
REM Walk through all directories and files on the drive
for /r "%1" %%F in (*) do (
    REM Check if file is empty
    if %%~zF equ 0 (
        REM Delete the empty file
        echo Deleting empty file: "%%F"
        del "%%F"
    )
)

REM Recursively call the function for all subdirectories
for /d %%D in ("%1\*") do (
    echo Processing directory: "%%D"
    call :delete_empty_files_recursive "%%D"
)

REM Delete empty directories after processing all files
for /d %%D in ("%1\*") do (
    dir "%%D" /b /a | findstr "^" >nul || (
        echo Deleting empty directory: "%%D"
        rd "%%D"
    )
)

exit /b
