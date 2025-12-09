#################################
Get-Process

#################################
Get-Process | Get-Member

#################################
$process = Get-Process -Name "notepad"

#################################
$process.Name
$process.Id
$process.StartTime
$process.CPU

#################################
$process.Kill()

#################################
Get-Process
Get-Process | Select-Object Name, Id, CPU

#################################
Get-Process | select *

#################################
Get-Process | select * | Out-GridView

#################################
Get-Process | Where-Object { $_.CPU -gt 10 }

#################################
Get-Process | Sort-Object CPU -Descending

#################################
Get-Process |
    Where-Object { $_.CPU -gt 3 } |
    Sort-Object CPU -Descending |
    Select-Object -First 5 Name, Id, CPU
