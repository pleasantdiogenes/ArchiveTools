Set objShell = CreateObject("WScript.Shell")
strResult = objShell.Run("mshta.exe ""popup.hta""", 1, True)
WScript.StdOut.WriteLine strResult
