#################################
Get-ChildItem -Path "C:\Windows"

#################################
Get-Process | Where-Object { $_.CPU -gt 5 }

#################################
Get-Process | Export-Csv "C:\temp\processos.csv"

#################################
Clear-Host
