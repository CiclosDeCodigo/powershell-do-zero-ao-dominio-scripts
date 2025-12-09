<#
A43 — Execução em background com Start-Job
Objetivo: Executar tarefas longas sem bloquear o terminal.

Descrição:
Cria um job que coleta tamanho total de arquivos.

Parâmetros:
Nenhum.

Resultado esperado:
Retorno assíncrono via Receive-Job.
#>

$job = Start-Job -ScriptBlock {
    Get-ChildItem -Path C:\Temp -Recurse | Measure-Object Length -Sum
}

Write-Host "Job iniciado. Aguardando resultado..." -ForegroundColor Cyan

$result = Receive-Job -Job $job -Wait -AutoRemoveJob
$result | Format-Table -AutoSize

# Exemplo:
# .\A43_StartJobBackground.ps1
