@echo off

REM Prompt the user to input the source drive, destination directory, and file extension
set /p source_drive=Enter the source drive (e.g., C:\):
set /p destination_directory=Enter the destination directory:
set /p file_extension=Enter the file extension (e.g., .txt):

REM Check if source drive exists
if not exist "%source_drive%\" (
    echo Source drive doesn't exist.
    pause
    exit /b 1
)

REM Check if destination directory exists, if not create it
if not exist "%destination_directory%\" (
    mkdir "%destination_directory%"
)

REM Move files with the specified extension from the source drive to the destination directory
for /r "%source_drive%\" %%F in (*%file_extension%) do (
    move "%%F" "%destination_directory%\"
    echo Moved %%~nxF to %destination_directory%
)

echo All files with extension %file_extension% moved from %source_drive% to %destination_directory%
pause
