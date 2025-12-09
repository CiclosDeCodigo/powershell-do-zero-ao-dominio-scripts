<#
A32 — Parar processos por nome
Objetivo: Encontrar e encerrar processos por nome.

Descrição:
Suporta modo DryRun para auditoria antes de matar os processos.

Parâmetros:
- Name
- DryRun

Resultado esperado:
Processos listados ou encerrados.
#>

param(
    [string]$Name = "notepad",
    [switch]$DryRun
)

$procs = Get-Process -Name $Name -ErrorAction SilentlyContinue

if ($procs.Count -eq 0) {
    Write-Host "Nenhum processo encontrado com o nome: $Name"
    exit 0
}

if ($DryRun) {
    Write-Host "Dry-run ativado. Processos que seriam finalizados:" -ForegroundColor Yellow
    $procs | Select-Object Id, ProcessName, CPU, WorkingSet | Format-Table -AutoSize
}
else {
    $procs | Stop-Process -Force
    Write-Host "Processos encerrados." -ForegroundColor Green
}

# Exemplo:
# .\A32_PararProcessosPorNome.ps1 -Name "chrome" -DryRun
