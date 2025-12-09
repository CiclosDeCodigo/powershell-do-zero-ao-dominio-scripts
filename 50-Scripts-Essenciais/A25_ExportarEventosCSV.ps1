<#
A25 — Exportar eventos do Event Viewer
Objetivo: Gerar relatórios de eventos para análise.

Descrição:
Filtra eventos recentes e salva em CSV.

Parâmetros:
- LogName
- Start
- Out

Resultado esperado:
CSV com eventos filtrados.
#>

param(
    [string]$LogName = "Application",
    [datetime]$Start = (Get-Date).AddDays(-7),
    [string]$Out = "C:\Temp\eventos.csv"
)

Write-Host "Exportando eventos do log '$LogName'..." -ForegroundColor Cyan

Get-WinEvent -FilterHashtable @{ LogName = $LogName; StartTime = $Start } |
    Select-Object TimeCreated, Id, LevelDisplayName, Message |
    Export-Csv -Path $Out -NoTypeInformation

Write-Host "Arquivo salvo: $Out" -ForegroundColor Green

# Exemplo:
# .\A25_ExportarEventosCSV.ps1 -LogName "System" -Start (Get-Date).AddDays(-2) -Out "C:\Temp\logs.csv"
