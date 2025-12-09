<#
A17 — Remover permissão ACL
Objetivo: Remover uma permissão específica de uma pasta.

Descrição:
Remove regras de ACL de um usuário ou grupo indicado.

Parâmetros:
- Path
- Identity

Resultado esperado:
Permissão removida e ACL atualizada.
#>

param(
    [string]$Path = "C:\Temp\Comum",
    [string]$Identity = "Everyone"
)

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado: $Path"
    exit 1
}

$acl = Get-Acl $Path
$removed = $false

foreach ($acc in $acl.Access) {
    if ($acc.IdentityReference -eq $Identity) {
        $acl.RemoveAccessRule($acc)
        $removed = $true
    }
}

if ($removed) {
    Set-Acl -Path $Path -AclObject $acl
    Write-Host "Permissão removida: $Identity" -ForegroundColor Green
} else {
    Write-Host "Nenhuma permissão explícita para $Identity encontrada." -ForegroundColor Yellow
}

# Exemplo:
# .\A17_RemoverPermissaoACL.ps1 -Path "C:\Dados" -Identity "Todos"
