Start-Process msiexec.exe -Wait -ArgumentList '/I "Client.Center.for.Configuration.Manager_v1.0.4.2.msi" /qn /norestart LICENSEE="Alo Press" LICENSEKEY="vRWo-AOvW-AACk-MX0A"'


$SelfUpdate = "C:\Program Files\Client Center for Configuration Manager\Plugin_SelfUpdate.dll"
if (Test-Path $SelfUpdate) { Remove-Item $SelfUpdate }
