' Define colors for the pop-up window
Const BLACK = 0
Const NEON_GREEN = &HFF00

' Create an HTML application for the pop-up window
strHTML = "<html><head><title>D3L3T3</title>"
strHTML = strHTML & "<style>"
strHTML = strHTML & "body {"
strHTML = strHTML & "    background-color: black;"
strHTML = strHTML & "    color: #00FF00; /* Neon green text color */"
strHTML = strHTML & "    font-family: Ethnocentric, sans-serif; /* Ethnocentric font */"
strHTML = strHTML & "    text-align: center; /* Center all text */"
strHTML = strHTML & "    width: 300px; /* Set initial width */"
strHTML = strHTML & "    height: auto; /* Set initial height */"
strHTML = strHTML & "    overflow: hidden; /* Disable scrollbars */"
strHTML = strHTML & "}"
strHTML = strHTML & "h1 {"
strHTML = strHTML & "    text-align: center;"
strHTML = strHTML & "}"
strHTML = strHTML & "label {"
strHTML = strHTML & "    display: inline-block;"
strHTML = strHTML & "    width: 100px;"
strHTML = strHTML & "    text-align: right;"
strHTML = strHTML & "    margin-right: 10px;"
strHTML = strHTML & "}"
strHTML = strHTML & "input[type='text'] {"
strHTML = strHTML & "    background-color: black;"
strHTML = strHTML & "    color: #00FF00; /* Neon green text color */"
strHTML = strHTML & "    border: 1px solid #00FF00; /* Neon green border */"
strHTML = strHTML & "    font-family: Ethnocentric, sans-serif; /* Ethnocentric font */"
strHTML = strHTML & "    text-align: center; /* Center the input text */"
strHTML = strHTML & "}"
strHTML = strHTML & "input[type='button'] {"
strHTML = strHTML & "    background-color: #003300; /* Darker green background color */"
strHTML = strHTML & "    color: #33FF33; /* Lighter green text color */"
strHTML = strHTML & "    border: 1px solid #33FF33; /* Light green border */"
strHTML = strHTML & "    border-radius: 5px; /* Rounded corners */"
strHTML = strHTML & "    font-family: Ethnocentric, sans-serif; /* Ethnocentric font */"
strHTML = strHTML & "}"
strHTML = strHTML & "</style>"
strHTML = strHTML & "<hta:application id=""D3L3T3"" applicationName=""D3L3T3"" border=""none"" caption=""no"" showInTaskbar=""yes"" minimizeButton=""no"" maximizeButton=""no"" scroll=""no"" singleInstance=""yes"" sysMenu=""no"" windowState=""normal"" contextMenu=""no"" navigable=""no"" selection=""no""/>"
strHTML = strHTML & "</head>"
strHTML = strHTML & "<body>"
strHTML = strHTML & "<h1>D3L3T3</h1>"
strHTML = strHTML & "<p>Please enter the drive letter and filename:</p>"
strHTML = strHTML & "<p><label for='driveLetter'>Drive:</label> <input type='text' id='driveLetter' placeholder='e.g., C:'></p>"
strHTML = strHTML & "<p><label for='fileName'>File Name:</label> <input type='text' id='fileName' placeholder='e.g., example.txt'></p>"
strHTML = strHTML & "<p><input type='button' value='OK' onclick='OKClick()' style='border-radius: 5px; background-color: #003300; color: #33FF33; border: 1px solid #33FF33;'> <input type='button' value='Close' onclick='window.close()' style='border-radius: 5px; background-color: #003300; color: #33FF33; border: 1px solid #33FF33;'></p>"
strHTML = strHTML & "<script type='text/javascript'>"
strHTML = strHTML & "function OKClick() {"
strHTML = strHTML & "    var driveLetter = document.getElementById('driveLetter').value;"
strHTML = strHTML & "    var fileName = document.getElementById('fileName').value;"
strHTML = strHTML & "    var objShell = new ActiveXObject('WScript.Shell');"
strHTML = strHTML & "    objShell.Run('cmd /c ""delete_files.bat"" ' + driveLetter + ' ' + fileName, 0, false);"
strHTML = strHTML & "}"
strHTML = strHTML & "</script>"
strHTML = strHTML & "</body>"
strHTML = strHTML & "</html>"

' Save the HTML content to a temporary file
Set objFSO = CreateObject("Scripting.FileSystemObject")
strTempFile = objFSO.GetSpecialFolder(2) & "\popup.html"
Set objFile = objFSO.CreateTextFile(strTempFile, True)
objFile.Write strHTML
objFile.Close

' Run the HTML application to display the pop-up window
Set objShell = CreateObject("WScript.Shell")
strResult = objShell.Run("mshta.exe """ & strTempFile & """", 1, True)

' Delete the temporary file
objFSO.DeleteFile strTempFile
