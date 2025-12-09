<#
A21 — Snapshot de CPU e Memória
Objetivo: Coletar rapidamente o uso de CPU e memória.

Descrição:
Realiza uma captura instantânea de indicadores do sistema usando Get-Counter.

Parâmetros:
- Samples  : Quantidade de capturas.
- Interval : Tempo em segundos entre cada captura.

Resultado esperado:
Tabela com CPU % e memória disponível.
#>

param(
    [int]$Samples = 3,
    [int]$Interval = 1
)

Write-Host "Coletando snapshot de CPU e Memória..." -ForegroundColor Cyan

Get-Counter '\Processor(_Total)\% Processor Time','\Memory\Available MBytes' `
    -SampleInterval $Interval -MaxSamples $Samples |
    Select-Object -ExpandProperty CounterSamples |
    Select-Object Path, CookedValue |
    Format-Table -AutoSize

# Exemplo:
# .\A21_SnapshotCPU_Mem.ps1 -Samples 5 -Interval 2
