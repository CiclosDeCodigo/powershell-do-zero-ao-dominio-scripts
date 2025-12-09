<#
A9 — Relatório de uso de disco
Objetivo: Descobrir quais pastas ocupam mais espaço.

Descrição:
Calcula o tamanho recursivo de cada pasta imediata e mostra
um ranking de uso do espaço.

Parâmetros:
- Path
- Top

Resultado esperado:
Lista das pastas maiores no diretório.
#>

param(
    [string]$Path = "C:\Temp",
    [int]$Top = 10
)

if (-not (Test-Path $Path)) {
    Write-Error "Pasta não encontrada: $Path"
    exit 1
}

Write-Host "Gerando relatório de uso de disco..." -ForegroundColor Cyan

Get-ChildItem -Path $Path -Directory | ForEach-Object {
    $size = (Get-ChildItem -Path $_.FullName -File -Recurse |
        Measure-Object -Property Length -Sum).Sum

    [PSCustomObject]@{
        Pasta = $_.FullName
        TamanhoBytes = $size
    }
} |
Sort-Object TamanhoBytes -Descending |
Select-Object -First $Top |
Format-Table -AutoSize

# Exemplo:
# .\A9_RelatorioUsoDisco.ps1 -Path "C:\Projetos" -Top 20
