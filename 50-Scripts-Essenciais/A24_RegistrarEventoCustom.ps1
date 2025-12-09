<#
A24 — Registrar evento customizado
Objetivo: Criar logs no Windows Event Viewer.

Descrição:
Cria um evento no log "Application" para auditoria e troubleshooting.

Parâmetros:
- Message
- Source
- EventId

Resultado esperado:
Evento visível no Event Viewer.
#>

param(
    [string]$Message = "Operação concluída com sucesso.",
    [string]$Source = "ScriptAuditoria",
    [int]$EventId = 1001
)

if (-not [System.Diagnostics.EventLog]::SourceExists($Source)) {
    New-EventLog -LogName Application -Source $Source
}

Write-EventLog -LogName Application -Source $Source -EventId $EventId -EntryType Information -Message $Message

Write-Host "Evento registrado no Event Viewer." -ForegroundColor Green

# Exemplo:
# .\A24_RegistrarEventoCustom.ps1 -Message "Backup finalizado" -Source "BackupScript"
