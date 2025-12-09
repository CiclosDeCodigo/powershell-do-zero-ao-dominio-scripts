<#
A38 — Manifesto de backup
Objetivo: Criar listagem completa de arquivos em um backup.

Descrição:
Gera CSV com caminho completo, tamanho e data de modificação.

Parâmetros:
- BackupPath
- Out

Resultado esperado:
Arquivo CSV contendo inventário completo.
#>

param(
    [string]$BackupPath = "D:\Backup\Temp",
    [string]$Out = "C:\Temp\backup-manifest.csv"
)

if (-not (Test-Path $BackupPath)) {
    Write-Error "Pasta de backup não encontrada: $BackupPath"
    exit 1
}

Write-Host "Gerando manifest de backup..." -ForegroundColor Cyan

Get-ChildItem -Path $BackupPath -Recurse -File |
    Select-Object FullName, Length, LastWriteTime |
    Export-Csv -Path $Out -NoTypeInformation

Write-Host "Manifest gerado em: $Out" -ForegroundColor Green

# Exemplo:
# .\A38_ManifestBackupCSV.ps1 -BackupPath "D:\Backup\Financeiro"
