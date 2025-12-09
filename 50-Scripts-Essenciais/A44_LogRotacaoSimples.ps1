<#
A44 — Rotação simples de logs
Objetivo: Rotacionar automaticamente um log quando atingir tamanho limite.

Descrição:
Se o log atingir MaxMB, ele é renomeado com timestamp e um novo é criado.

Parâmetros:
- Log
- MaxMB
- Message

Resultado esperado:
Rotação automática e mensagem adicionada ao novo log.
#>

param(
    [string]$Log = "C:\Temp\app.log",
    [int]$MaxMB = 5,
    [string]$Message = "$(Get-Date -Format o) - Mensagem de log"
)

if (Test-Path $Log -and ((Get-Item $Log).Length / 1MB -ge $MaxMB)) {
    $timestamp = (Get-Date).ToString("yyyyMMddHHmmss")
    Move-Item $Log "$Log.$timestamp"
    Write-Host "Log rotacionado." -ForegroundColor Yellow
}

$Message | Out-File -FilePath $Log -Append
Write-Host "Mensagem registrada no log." -ForegroundColor Green

# Exemplo:
# .\A44_LogRotacaoSimples.ps1 -Log "C:\Logs\app.log" -MaxMB 1 -Message "Início do processo"
