#################################
Get-Process | Format-Table Name, Id, CPU -AutoSize

#################################
Get-ChildItem -path "C:\temp\" | Format-List *

#################################
Get-Command | Format-Wide Name -Column 2

#################################
Get-Process | Out-GridView

#################################
Get-Service | Out-File "C:\temp\servicos.txt"

#################################
Get-Process | Select-Object Name, Id, CPU | Export-Csv "C:\temp\processos.csv" -NoTypeInformation -Encoding UTF8BOM

#################################
Get-Service | Select Name, Status | ConvertTo-Json | Out-File "C:\temp\servicos.json"
