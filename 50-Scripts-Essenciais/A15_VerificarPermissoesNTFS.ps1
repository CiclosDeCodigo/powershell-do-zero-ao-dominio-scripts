<#
A15 — Verificar permissões NTFS
Objetivo: Mostrar ACLs NTFS de uma pasta.

Descrição:
Exibe as permissões configuradas na pasta indicada, incluindo usuários,
grupos e tipo de acesso.

Parâmetros:
- Path

Resultado esperado:
Lista de permissões NTFS.
#>

param([string]$Path = "C:\Temp\Comum")

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

(Get-Acl -Path $Path).Access |
    Select-Object IdentityReference, FileSystemRights, AccessControlType |
    Format-Table -AutoSize

# Exemplo:
# .\A15_VerificarPermissoesNTFS.ps1 -Path "C:\Compartilhamentos\RH"
