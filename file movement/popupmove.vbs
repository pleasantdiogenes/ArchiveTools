' Create an instance of the WScript Shell
Set objShell = CreateObject("WScript.Shell")

' Prompt the user for the source drive, destination directory, and file extension
source_drive = InputBox("Enter the source drive (e.g., C:\):", "Source Drive", "")
destination_directory = InputBox("Enter the destination directory:", "Destination Directory", "")
file_extension = InputBox("Enter the file extension (e.g., .txt):", "File Extension", "")

' Construct the command to execute the batch script
cmd = "cmd /c move_files.bat " & source_drive & " " & destination_directory & " " & file_extension

' Execute the command
objShell.Run cmd, 1, True
