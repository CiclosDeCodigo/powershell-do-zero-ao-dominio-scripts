#################################
Get-Process

#################################
Get-Process -Name notepad

#################################
Get-Process -Name chrome, explorer, pwsh

#################################
Get-Process | Select-Object Name, Id, CPU, WorkingSet

#################################
Get-Process | Sort-Object CPU -Descending

#################################
Stop-Process -Name notepad

#################################
Stop-Process -Id 1234

#################################
Stop-Process -Name chrome -Force

#################################
Start-Process notepad

#################################
Start-Process "notepad.exe" -ArgumentList "C:\Temp\log.txt"

#################################
Get-Service

#################################
Get-Service -Name wuauserv  # Windows Update

#################################
Get-Service | Where-Object {$_.Status -eq 'Stopped'}

#################################
Start-Service -Name wuauserv


#################################
Stop-Service -Name wuauserv

#################################
Restart-Service -Name wuauserv
# ou
Stop-Service wuauserv; Start-Service wuauserv
