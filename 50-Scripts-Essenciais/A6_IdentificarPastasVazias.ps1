<#
A6 — Identificar pastas vazias
Objetivo: Encontrar pastas vazias para auditoria ou limpeza.

Descrição:
O script percorre recursivamente o caminho indicado e retorna
todas as pastas que não possuem arquivos nem subpastas úteis.

Parâmetros:
- Path: Caminho base.

Resultado esperado:
Lista de pastas vazias.
#>

param([string]$Path = "C:\Temp")

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

Write-Host "Procurando pastas vazias em $Path ..." -ForegroundColor Cyan

Get-ChildItem -Path $Path -Directory -Recurse -ErrorAction SilentlyContinue |
    Where-Object { -not (Get-ChildItem -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue) } |
    Select-Object FullName |
    Format-Table -AutoSize

# Exemplo:
# .\A6_IdentificarPastasVazias.ps1 -Path "C:\Data"
