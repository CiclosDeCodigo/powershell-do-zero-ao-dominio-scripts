<#
A10 — Dry-run de exclusão
Objetivo: Simular a exclusão de arquivos antigos sem realmente apagar nada.

Descrição:
Lista arquivos mais antigos que X dias e opcionalmente exporta.

Parâmetros:
- Path
- Days
- ExportCsv

Resultado esperado:
Lista de arquivos candidatos a remoção.
#>

param(
    [string]$Path = "C:\Temp",
    [int]$Days = 365,
    [string]$ExportCsv = ""
)

if (-not (Test-Path $Path)) {
    Write-Error "Pasta não encontrada: $Path"
    exit 1
}

$cutoff = (Get-Date).AddDays(-$Days)

Write-Host "Listando arquivos candidatos à remoção..." -ForegroundColor Cyan

$files = Get-ChildItem -Path $Path -File -Recurse |
    Where-Object { $_.LastWriteTime -lt $cutoff } |
    Select-Object FullName, LastWriteTime, Length

if ($ExportCsv) {
    $files | Export-Csv -Path $ExportCsv -NoTypeInformation -Encoding UTF8
    Write-Host "Exportado para $ExportCsv" -ForegroundColor Green
} else {
    $files | Format-Table -AutoSize
}

# Exemplo:
# .\A10_DryRunExclusao.ps1 -Path "C:\Logs" -Days 200 -ExportCsv "C:\Temp\dryrun.csv"
