<#
A34 — Listar serviços Automáticos que estão parados
Objetivo: Identificar serviços que deveriam estar rodando.

Descrição:
Procura serviços com StartType = Automatic e Status = Stopped.

Parâmetros:
Nenhum.

Resultado esperado:
Lista de serviços problemáticos.
#>

Get-Service |
    Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -ne 'Running' } |
    Select-Object Name, Status |
    Format-Table -AutoSize

# Exemplo:
# .\A34_ServicosAutoParados.ps1
