<#
A31 — Reiniciar serviço
Objetivo: Reiniciar um serviço do Windows com segurança.

Descrição:
Executa Restart-Service com tratamento de erro e exibe o status final.

Parâmetros:
- ServiceName

Resultado esperado:
Serviço reiniciado e status atual exibido.
#>

param([string]$ServiceName = "Spooler")

try {
    Restart-Service -Name $ServiceName -Force -ErrorAction Stop
    $s = Get-Service -Name $ServiceName
    Write-Host "Serviço reiniciado. Status atual: $($s.Status)" -ForegroundColor Green
}
catch {
    Write-Error "Erro ao reiniciar o serviço: $_"
}

# Exemplo:
# .\A31_ReiniciarServico.ps1 -ServiceName "W32Time"
