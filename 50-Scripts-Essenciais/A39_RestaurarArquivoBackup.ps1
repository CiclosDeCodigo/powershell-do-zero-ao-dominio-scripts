<#
A39 — Restaurar arquivo do backup
Objetivo: Copiar arquivo do backup para um destino.

Descrição:
Copia o arquivo e mostra metadados do arquivo restaurado.

Parâmetros:
- BackupFile
- Target

Resultado esperado:
Arquivo restaurado no destino.
#>

param(
    [string]$BackupFile = "D:\Backup\Temp\doc.pdf",
    [string]$Target = "C:\Temp\doc.pdf"
)

if (-not (Test-Path $BackupFile)) {
    Write-Error "Arquivo de backup não encontrado: $BackupFile"
    exit 1
}

Copy-Item -Path $BackupFile -Destination $Target -Force

Write-Host "Arquivo restaurado:" -ForegroundColor Green
Get-Item $Target | Select-Object FullName, Length, LastWriteTime | Format-Table -AutoSize

# Exemplo:
# .\A39_RestaurarArquivoBackup.ps1 -BackupFile "D:\Backup\Fin\relatorio.xlsx" -Target "C:\Restore\relatorio.xlsx"
