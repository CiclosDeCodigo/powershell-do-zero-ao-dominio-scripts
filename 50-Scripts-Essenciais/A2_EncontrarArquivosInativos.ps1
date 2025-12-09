<# 
A2 — Encontrar arquivos inativos
Objetivo: Localizar arquivos que não são modificados há X dias.

Descrição:
Identifica arquivos antigos para avaliação de arquivamento.

Parâmetros:
- Path
- Days
- ExportCsv

Resultado esperado:
Lista de arquivos antigos ou exportação para CSV.
#>

param(
    [string]$Path = "C:\Temp",
    [int]$Days = 180,
    [string]$ExportCsv = ""
)

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

$cutoff = (Get-Date).AddDays(-$Days)
Write-Host "Procurando arquivos em $Path não modificados há $Days dias (antes de $cutoff)..." -ForegroundColor Cyan

$results = Get-ChildItem -Path $Path -File -Recurse -ErrorAction SilentlyContinue |
  Where-Object { $_.LastWriteTime -lt $cutoff } |
  Select-Object FullName, LastWriteTime, Length

if ($ExportCsv) {
    $results | Export-Csv -Path $ExportCsv -NoTypeInformation -Encoding UTF8
    Write-Host "Resultados exportados para $ExportCsv"
} else {
    $results | Format-Table -AutoSize
}

# Exemplo:
# .\A2_EncontrarArquivosInativos.ps1 -Path "C:\Data" -Days 365 -ExportCsv "C:\Temp\inativos.csv"
