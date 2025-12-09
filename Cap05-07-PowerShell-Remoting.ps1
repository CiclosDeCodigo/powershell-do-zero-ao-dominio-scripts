#################################
Enable-PSRemoting -Force
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value 'localhost'
Restart-Service WinRM

#################################
$sess = New-PSSession -ComputerName localhost -EnableNetworkAccess

#################################
Invoke-Command -Session $sess -ScriptBlock { Get-Process | Select-Object * -First 1 }

#################################
Remove-PSSession $sess
