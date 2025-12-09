<#
A16 — Detectar pastas com FullControl para Everyone
Objetivo: Encontrar pastas com permissão excessiva.

Descrição:
O script percorre o caminho informado e identifica todas as pastas
que possuem permissão NTFS de FullControl para o grupo Everyone.
Excelente para auditorias de segurança.

Parâmetros:
- Path

Resultado esperado:
Lista de pastas com permissão FullControl atribuída a Everyone.
#>

param([string]$Path = "C:\Temp")

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

Write-Host "Auditando permissões NTFS em $Path ..." -ForegroundColor Cyan

$results = @()

Get-ChildItem -Path $Path -Directory -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    $acl = Get-Acl $_.FullName
    foreach ($ace in $acl.Access) {
        if ($ace.IdentityReference -match "Everyone" -and $ace.FileSystemRights.ToString().Contains("FullControl")) {
            $results += $_.FullName
            break
        }
    }
}

if ($results.Count -gt 0) {
    Write-Host "Pastas com permissão FullControl para Everyone:" -ForegroundColor Yellow
    $results | Format-Table -AutoSize
} else {
    Write-Host "Nenhuma pasta com FullControl para Everyone encontrada." -ForegroundColor Green
}

# Exemplo:
# .\A16_DetectarFullControlEveryone.ps1 -Path "C:\Departamentos"
