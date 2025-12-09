<# 
A4 — Mover arquivos por extensão
Objetivo: Organizar arquivos movendo todos os que possuem uma extensão definida para outra pasta.

Descrição:
Ideal para limpeza, organização ou categorização de arquivos.  
O script permite Dry-Run para simular o que será movido.

Parâmetros:
- Source
- Ext
- Target
- DryRun

Resultado esperado:
Arquivos movidos ou listados (em modo DryRun).
#>

param(
    [string]$Source = "C:\Temp",
    [string]$Ext = "log",
    [string]$Target = "C:\Temp\Logs",
    [switch]$DryRun
)

if (-not (Test-Path $Source)) {
    Write-Error "Pasta de origem não encontrada: $Source"
    exit 1
}

New-Item -Path $Target -ItemType Directory -Force | Out-Null

$items = Get-ChildItem -Path $Source -Recurse -File -Filter "*.$Ext" -ErrorAction SilentlyContinue

if ($items.Count -eq 0) {
    Write-Host "Nenhum arquivo encontrado com extensão *.$Ext"
    exit 0
}

if ($DryRun) {
    Write-Host "Dry-run ativado. Arquivos que seriam movidos:" -ForegroundColor Yellow
    $items | Select-Object FullName | Format-Table -AutoSize
} else {
    foreach ($item in $items) {
        Move-Item -Path $item.FullName -Destination $Target -Force
    }
    Write-Host "Arquivos movidos para $Target" -ForegroundColor Green
}

# Exemplo:
# .\A4_MoverArquivosPorExtensao.ps1 -Source "C:\Temp" -Ext "txt" -Target "C:\Temp\Textos" -DryRun
