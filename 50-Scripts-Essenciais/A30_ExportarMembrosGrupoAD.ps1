<#
A30 — Exportar membros de um grupo AD
Objetivo: Exportar usuários pertencentes a um grupo.

Descrição:
Retorna membros de um grupo e exporta para CSV.

Parâmetros:
- GroupName
- Out

Resultado esperado:
CSV com todos os membros do grupo.
#>

param(
    [string]$GroupName = "Domain Users",
    [string]$Out = "C:\Temp\group-members.csv"
)

try {
    Import-Module ActiveDirectory -ErrorAction Stop

    Get-ADGroupMember -Identity $GroupName -Recursive |
        Select-Object Name, SamAccountName |
        Export-Csv -Path $Out -NoTypeInformation

    Write-Host "Membros exportados para $Out" -ForegroundColor Green
}
catch {
    Write-Warning "Erro ao acessar AD: $_"
}

# Exemplo:
# .\A30_ExportarMembrosGrupoAD.ps1 -GroupName "Financeiro" -Out "C:\Relatorios\fin-members.csv"
