<#
A20 — Gerar hashes SHA256
Objetivo: Criar um inventário de integridade de arquivos.

Descrição:
Percorre arquivos e gera seu hash SHA256 para auditorias, migrações ou backup.

Parâmetros:
- Path
- Output

Resultado esperado:
Arquivo CSV contendo caminho, hash e metadados.
#>

param(
    [string]$Path = "C:\Temp",
    [string]$Output = "C:\Temp\hashes.csv"
)

if (-not (Test-Path $Path)) {
    Write-Error "Diretório não encontrado: $Path"
    exit 1
}

Write-Host "Gerando hashes SHA256..." -ForegroundColor Cyan

Get-ChildItem -Path $Path -File -Recurse -ErrorAction SilentlyContinue |
ForEach-Object {
    $h = Get-FileHash -Algorithm SHA256 -Path $_.FullName
    [PSCustomObject]@{
        FullName = $_.FullName
        Hash = $h.Hash
        Length = $_.Length
        LastWriteTime = $_.LastWriteTime
    }
} | Export-Csv -Path $Output -NoTypeInformation -Encoding UTF8

Write-Host "Hashes exportados para: $Output" -ForegroundColor Green

# Exemplo:
# .\A20_GerarHashesSHA256.ps1 -Path "C:\Projetos" -Output "C:\Temp\saida.csv"
