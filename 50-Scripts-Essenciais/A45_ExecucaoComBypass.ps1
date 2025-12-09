<#
A45 — Execução de script com Bypass
Objetivo: Executar um script ignorando a ExecutionPolicy local.

Descrição:
Útil em ambientes onde as políticas restringem execução de scripts.

Parâmetros:
- ScriptPath

Resultado esperado:
Script executado ignorando restrições.
#>

param([string]$ScriptPath = "C:\Scripts\meu-script.ps1")

if (-not (Test-Path $ScriptPath)) {
    Write-Error "Script não encontrado: $ScriptPath"
    exit 1
}

Write-Host "Executando script com ExecutionPolicy Bypass..." -ForegroundColor Cyan

powershell.exe -NoProfile -ExecutionPolicy Bypass -File $ScriptPath

# Exemplo:
# .\A45_ExecucaoComBypass.ps1 -ScriptPath "C:\Automacoes\job.ps1"
