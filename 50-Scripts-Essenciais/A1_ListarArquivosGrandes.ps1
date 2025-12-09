<# 
A1 — Listar arquivos grandes numa pasta
Objetivo: Identificar os maiores arquivos numa pasta (top N).

Descrição:
Este script percorre recursivamente uma pasta e lista os maiores arquivos encontrados.

Parâmetros:
- Path: Caminho base.
- Top: Quantidade de arquivos a listar.

Resultado esperado:
A saída mostra que os maiores arquivos foram listados com sucesso.
#>

param(
    [string]$Path = "C:\Temp",
    [int]$Top = 10
)

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

Write-Host "Listando os $Top maiores arquivos em: $Path ..." -ForegroundColor Cyan

Get-ChildItem -Path $Path -File -Recurse -ErrorAction SilentlyContinue |
    Sort-Object Length -Descending |
    Select-Object FullName,Length -First $Top | Format-Table -AutoSize

# Exemplo:
# .\A1_ListarArquivosGrandes.ps1 -Path "C:\Logs" -Top 20
