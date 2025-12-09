<#
A13 — Mapear unidade de rede
Objetivo: Mapear uma pasta compartilhada para uma letra de drive.

Descrição:
Seleciona automaticamente a primeira letra disponível entre A–Z e mapeia.

Parâmetros:
- Unc

Resultado esperado:
Unidade de rede mapeada e pronta para uso.
#>

param([string]$Unc = "\\localhost\Comum")

$drive = (65..90 | ForEach-Object { [char]$_ } | Where-Object { -not (Test-Path "$_:\") }) | Select-Object -First 1

if ($null -eq $drive) {
    Write-Error "Nenhuma letra disponível para mapear."
    exit 1
}

New-PSDrive -Name $drive -PSProvider FileSystem -Root $Unc -Persist | Out-Null

Write-Host "Unidade mapeada: $drive:" -ForegroundColor Green

# Exemplo:
# .\A13_MapearUnidadeRede.ps1 -Unc "\\Servidor\Projetos"
