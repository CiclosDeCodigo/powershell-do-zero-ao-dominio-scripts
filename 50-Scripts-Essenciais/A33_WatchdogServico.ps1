<#
A33 — Watchdog de serviço
Objetivo: Monitorar um serviço e reiniciar automaticamente caso pare.

Descrição:
Roda em loop e verifica se o serviço está ativo.

Parâmetros:
- ServiceName
- IntervalSec

Resultado esperado:
Serviço mantido sempre em execução.
#>

param(
    [string]$ServiceName = "Spooler",
    [int]$IntervalSec = 60
)

Write-Host "Watchdog iniciado para o serviço $ServiceName." -ForegroundColor Cyan

while ($true) {
    try {
        $s = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
        if ($s.Status -ne "Running") {
            Start-Service -Name $ServiceName
            Write-Host "Serviço reiniciado." -ForegroundColor Green
        }
    }
    catch {
        Write-Warning "Erro ao consultar serviço."
    }
    Start-Sleep -Seconds $IntervalSec
}

# Exemplo:
# .\A33_WatchdogServico.ps1 -ServiceName "W32Time" -IntervalSec 30
