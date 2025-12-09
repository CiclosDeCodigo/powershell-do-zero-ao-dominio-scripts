<#
A7 — Purga de arquivos temporários
Objetivo: Remover arquivos antigos para liberar espaço.

Descrição:
Remover arquivos mais antigos que X dias da pasta definida.

Parâmetros:
- Path
- Days
- DryRun

Resultado esperado:
Lista ou remoção dos arquivos antigos.
#>

param(
    [string]$Path = $env:TEMP,
    [int]$Days = 30,
    [switch]$DryRun
)

if (-not (Test-Path $Path)) {
    Write-Error "Pasta não encontrada: $Path"
    exit 1
}

$cutoff = (Get-Date).AddDays(-$Days)

Write-Host "Procurando arquivos com mais de $Days dias..." -ForegroundColor Cyan

$toRemove = Get-ChildItem -Path $Path -File -Recurse -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -lt $cutoff }

if ($toRemove.Count -eq 0) {
    Write-Host "Nenhum arquivo antigo encontrado."
    exit 0
}

if ($DryRun) {
    Write-Host "Dry-run ativado:" -ForegroundColor Yellow
    $toRemove | Select-Object FullName, LastWriteTime, Length | Format-Table
} else {
    $toRemove | Remove-Item -Force
    Write-Host "Arquivos removidos com sucesso." -ForegroundColor Green
}

# Exemplo:
# .\A7_PurgaTemporarios.ps1 -Path "C:\Temp" -Days 90 -DryRun
