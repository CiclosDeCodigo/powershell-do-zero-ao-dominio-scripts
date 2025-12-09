<# 
A3 — Contar arquivos por extensão
Objetivo: Exibir quantos arquivos existem por extensão dentro de uma pasta.

Descrição:
Percorre recursivamente uma pasta e agrupa arquivos por extensão, exibindo quantos existem em cada uma.

Parâmetros:
- Path
- Top

Resultado esperado:
Uma lista de extensões com suas quantidades.
#>

param(
    [string]$Path = "C:\Temp",
    [int]$Top = 20
)

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

Write-Host "Contando arquivos por extensão em $Path ..." -ForegroundColor Cyan

Get-ChildItem -Path $Path -File -Recurse -ErrorAction SilentlyContinue |
  Group-Object Extension |
  Sort-Object Count -Descending |
  Select-Object -First $Top |
  Format-Table Name,Count -AutoSize

# Exemplo:
# .\A3_ContarPorExtensao.ps1 -Path "C:\Projetos" -Top 10
