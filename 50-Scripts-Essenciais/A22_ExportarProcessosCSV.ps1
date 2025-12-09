<#
A22 — Exportar lista de processos
Objetivo: Capturar snapshot de processos e salvar em CSV.

Descrição:
Útil para auditoria, troubleshooting e registros periódicos.

Parâmetros:
- Output

Resultado esperado:
Arquivo CSV com processos, memória e CPU.
#>

param([string]$Output = "C:\Temp\processos.csv")

Write-Host "Exportando lista de processos..." -ForegroundColor Cyan

Get-Process |
    Select-Object Id, ProcessName, CPU, WorkingSet |
    Export-Csv -Path $Output -NoTypeInformation

Write-Host "Arquivo gerado em: $Output" -ForegroundColor Green

# Exemplo:
# .\A22_ExportarProcessosCSV.ps1 -Output "C:\Relatorios\proc.csv"
