<#
A46 — Ping em massa
Objetivo: Testar conectividade para uma lista de hosts.

Descrição:
Realiza Test-Connection para múltiplos hosts e apresenta resultado sucinto.
Útil para checagem rápida de disponibilidade de recursos de rede.

Parâmetros:
- Hosts: lista de IPs ou nomes.
- Count: número de pacotes por host.

Resultado esperado:
Tabela com host e se está alcançável (True/False).
#>

param(
    [string[]]$Hosts = @("8.8.8.8","localhost"),
    [int]$Count = 2
)

$results = foreach ($h in $Hosts) {
    $ok = Test-Connection -ComputerName $h -Count $Count -Quiet -ErrorAction SilentlyContinue
    [PSCustomObject]@{ Host = $h; Reachable = $ok }
}

$results | Format-Table -AutoSize

# Exemplo:
# .\A46_PingEmMassa.ps1 -Hosts "8.8.8.8","10.0.0.1" -Count 3
