## Uninstall BGinfo
### Remove Files
Remove-Item -Path "C:\Program Files\BGinfo" -Force -Recurse

### Remove Regsitry Key (BGinfo run at login)
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name 'bginfo'
