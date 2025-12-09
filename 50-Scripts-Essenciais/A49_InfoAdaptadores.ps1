<#
A49 — Informações dos adaptadores de rede
Objetivo: Listar IPs, máscaras e servidores DNS configurados.

Descrição:
Combina Get-NetIPAddress e Get-DnsClientServerAddress para exibir informações relevantes
sobre interfaces de rede.

Parâmetros:
Nenhum.

Resultado esperado:
Tabela com InterfaceAlias, IP, PrefixLength e servidores DNS.
#>

Get-NetIPAddress |
    Select-Object InterfaceAlias, IPAddress, PrefixLength, AddressFamily |
    Format-Table -AutoSize

Get-DnsClientServerAddress |
    Select-Object InterfaceAlias, ServerAddresses |
    Format-Table -AutoSize

# Exemplo:
# .\A49_InfoAdaptadores.ps1
