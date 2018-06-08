'========================================================================================
' BGinfo Installation Script
'========================================================================================
'
' Script Details:
' --------------
' This script copies the BGinfo files to the C:\bginfo folder and sets the run registry key
'========================================================================================
Option Explicit

'Declare Variables and constants
Dim objShell, objFSO, intErrorCode

'Create objects
Set objShell = CreateObject("WScript.Shell")
Set objFSO = createobject("scripting.filesystemobject")

'========================================================================================
'Main body
'========================================================================================
On Error Resume Next



'Create the C:\Program Files\BGinfo folder
If not objFSO.FolderExists("C:\Program Files\BGinfo") Then
 objFSO.CreateFolder("C:\Program Files\BGinfo")
End If



'Copy the bginfo files
intErrorCode = intErrorCode + objFSO.CopyFile(objShell.CurrentDirectory & "\Bginfo64.exe", "C:\Program Files\BGinfo\")
intErrorCode = intErrorCode + objFSO.CopyFile(objShell.CurrentDirectory & "\wstat.bgi", "C:\Program Files\BGinfo\")

'Add the bginfo shortcut to the run registry key
intErrorCode = intErrorCode + objshell.RegWrite("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\bginfo", "C:\Program Files\BGinfo\Bginfo64.exe /accepteula /iC:\Program Files\BGinfo\wstat.bgi /timer:0", "REG_SZ")

objShell.Run "C:\Program Files\BGinfo\Bginfo64.exe /accepteula /iC:\Program Files\BGinfo\wstat.bgi /timer:0"
 
'Cleanup
Set objShell = Nothing
Set objFSO = Nothing

'return errorcode for install to SCCM
WScript.Quit(intErrorCode)
'========================================================================================
