<#
A48 — Traceroute (tracert)
Objetivo: Executar tracert para um destino e exibir o caminho de rede.

Descrição:
Invoca o utilitário nativo tracert (Windows) e apresenta o resultado.
Pode ser útil para diagnóstico de rotas e latência.

Parâmetros:
- Dest: IP ou hostname de destino.

Resultado esperado:
Saída do tracert com hops listados.
#>

param([string]$Dest = "8.8.8.8")

Write-Host "Executando tracert para $Dest ..." -ForegroundColor Cyan
tracert $Dest

# Exemplo:
# .\A48_TracertDestino.ps1 -Dest "example.com"
