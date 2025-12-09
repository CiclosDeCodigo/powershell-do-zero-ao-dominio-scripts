<#
A36 — Backup usando Robocopy
Objetivo: Realizar backup completo de uma pasta usando Robocopy.

Descrição:
Cria a pasta de destino se necessário e executa o backup espelhado (/MIR),
incluindo tolerância a falhas e modo robusto (/Z).

Parâmetros:
- Source
- Dest

Resultado esperado:
Backup completo e espelhado no destino.
#>

param(
    [string]$Source = "C:\Temp",
    [string]$Dest = "D:\Backup\Temp"
)

if (-not (Test-Path $Source)) {
    Write-Error "Pasta de origem não encontrada: $Source"
    exit 1
}

New-Item -Path $Dest -ItemType Directory -Force | Out-Null

$cmd = "robocopy `"$Source`" `"$Dest`" /MIR /Z /R:2 /W:5"
Write-Host "Executando: $cmd" -ForegroundColor Cyan

Invoke-Expression $cmd

Write-Host "Backup concluído." -ForegroundColor Green

# Exemplo:
# .\A36_BackupRobocopy.ps1 -Source "C:\Projetos" -Dest "D:\Backup\Projetos"
