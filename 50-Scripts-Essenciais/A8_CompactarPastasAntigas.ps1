<#
A8 — Compactar pastas antigas
Objetivo: Compactar pastas cujo conteúdo é antigo.

Descrição:
Cria arquivos ZIP de pastas que possuem arquivos antigos,
ajudando arquivamento e economia de espaço.

Parâmetros:
- Path
- Days
- Dest

Resultado esperado:
ZIPs gerados conforme critérios.
#>

param(
    [string]$Path = "C:\Temp",
    [int]$Days = 365,
    [string]$Dest = "C:\Temp\Archive"
)

if (-not (Test-Path $Path)) {
    Write-Error "Pasta não encontrada: $Path"
    exit 1
}

New-Item -Path $Dest -ItemType Directory -Force | Out-Null

$cutoff = (Get-Date).AddDays(-$Days)
Write-Host "Compactando pastas com arquivos antigos..." -ForegroundColor Cyan

Get-ChildItem -Path $Path -Directory | ForEach-Object {
    $olderFiles = Get-ChildItem -Path $_.FullName -File -Recurse |
        Where-Object { $_.LastWriteTime -lt $cutoff }

    if ($olderFiles) {
        $zip = Join-Path $Dest ("{0}.zip" -f $_.Name)
        Compress-Archive -Path $_.FullName -DestinationPath $zip -Force
        Write-Host "Compactado: $zip" -ForegroundColor Green
    }
}

# Exemplo:
# .\A8_CompactarPastasAntigas.ps1 -Path "C:\Dados" -Days 180 -Dest "D:\Arquivos"
