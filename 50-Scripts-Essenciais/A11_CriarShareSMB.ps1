<#
A11 — Criar compartilhamento SMB
Objetivo: Criar um compartilhamento de rede local (SMB).

Descrição:
Cria uma pasta caso ela não exista e publica como compartilhamento SMB
com permissões FullAccess configuráveis.

Parâmetros:
- Folder
- ShareName
- Access

Resultado esperado:
Compartilhamento criado ou informado se já existe.
#>

param(
    [string]$Folder = "C:\Temp\Comum",
    [string]$ShareName = "Comum",
    [string]$Access = "Everyone"
)

if (-not (Test-Path $Folder)) {
    Write-Host "Criando pasta: $Folder"
    New-Item -Path $Folder -ItemType Directory -Force | Out-Null
}

if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
    Write-Host "O compartilhamento '$ShareName' já existe." -ForegroundColor Yellow
} else {
    New-SmbShare -Name $ShareName -Path $Folder -FullAccess $Access | Out-Null
    Write-Host "Compartilhamento criado: \\localhost\$ShareName" -ForegroundColor Green
}

# Exemplo:
# .\A11_CriarShareSMB.ps1 -Folder "C:\Departamentos\Financeiro" -ShareName "Fin" -Access "Todos"
