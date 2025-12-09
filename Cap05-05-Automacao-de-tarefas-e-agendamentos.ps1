#################################
$logPath = "C:\Temp\agendamento-log.txt"
"Script executado em: $(Get-Date)" | Out-File -FilePath $logPath -Append

#################################
$Limited = New-ScheduledTaskAction -Execute "powershell.exe" `
    -Argument "-NoProfile -ExecutionPolicy Bypass -File C:\PS-Scripts\data-hora.ps1"
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) -RepetitionInterval (New-TimeSpan -Minutes 1)
$Principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Limited
Register-ScheduledTask -TaskName "TesteAgendamentoPowerShell" -Action $Action -Trigger $Trigger -Principal $Principal

#################################
Get-ScheduledTask -TaskName "TesteAgendamentoPowerShell"

#################################
Get-ScheduledTask -TaskName "TesteAgendamentoPowerShell" | Get-ScheduledTaskInfo

#################################
Get-Content C:\Temp\agendamento-log.txt

#################################
Unregister-ScheduledTask -TaskName "TesteAgendamentoPowerShell" -Confirm:$false
