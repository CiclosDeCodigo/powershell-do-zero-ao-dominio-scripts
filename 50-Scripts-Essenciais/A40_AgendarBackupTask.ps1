<#
A40 — Agendar tarefa de backup
Objetivo: Criar uma tarefa agendada que executa um script diariamente.

Descrição:
Cria uma Scheduled Task no Windows que roda como SYSTEM às 03h da manhã.

Parâmetros:
- ScriptPath
- TaskName

Resultado esperado:
Tarefa criada e visível no Task Scheduler.
#>

param(
    [string]$ScriptPath = "C:\Scripts\backup.ps1",
    [string]$TaskName = "BackupDiario"
)

$action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
    -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`""

$trigger = New-ScheduledTaskTrigger -Daily -At 3am

Register-ScheduledTask -TaskName $TaskName `
    -Action $action `
    -Trigger $trigger `
    -User "SYSTEM" `
    -RunLevel Highest `
    -Force

Write-Host "Tarefa agendada criada: $TaskName" -ForegroundColor Green

# Exemplo:
# .\A40_AgendarBackupTask.ps1 -ScriptPath "C:\Scripts\backup.ps1" -TaskName "Backup_Financeiro"
