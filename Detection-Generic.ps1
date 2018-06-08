$appToMatch = '*Notepad++*'
$pubToMatch = '*Notepad++*Team*'
$verToMatch = '7.5.5'

IF ($env:PROCESSOR_ARCHITECTURE -eq "AMD64")

{

IF(Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" -Recurse |
   ForEach-Object { Get-ItemProperty $_.pspath } |
   Where-Object {($_.DisplayName -like $appToMatch) -and ($_.Publisher -like $pubToMatch) -and ( [Version]$_.DisplayVersion -lt [Version]$verToMatch)}) {Write-Host 0;exit 0} else {Clear-Host 0; exit 0}

 }
 Else
 {
 
 IF(Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Recurse |
   ForEach-Object { Get-ItemProperty $_.pspath } |
   Where-Object {($_.DisplayName -like $appToMatch) -and ($_.Publisher -like $pubToMatch) -and ( [Version]$_.DisplayVersion -lt [Version]$verToMatch)}) {Write-Host 0;exit 0} else {Clear-Host 0; exit 0}

 } 
