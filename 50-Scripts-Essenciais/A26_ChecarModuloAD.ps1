<#
A26 — Checar módulo ActiveDirectory
Objetivo: Verificar se o módulo ActiveDirectory está instalado no sistema.

Descrição:
Esse script verifica a disponibilidade do módulo e informa se pode ser carregado.

Parâmetros:
Nenhum.

Resultado esperado:
Mensagem indicando se o módulo está disponível.
#>

if (Get-Module -ListAvailable -Name ActiveDirectory) {
    Write-Host "Módulo ActiveDirectory disponível." -ForegroundColor Green
} else {
    Write-Warning "Módulo ActiveDirectory NÃO está disponível neste sistema."
}

# Exemplo:
# .\A26_ChecarModuloAD.ps1
