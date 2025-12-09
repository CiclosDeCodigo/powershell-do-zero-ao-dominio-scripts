<#
A35 — Coletar dump de processo
Objetivo: Gerar arquivo de dump de memória de um processo.

Descrição:
Se Save-ProcessDump estiver disponível, cria um dump no diretório informado.

Parâmetros:
- Pid
- OutDir

Resultado esperado:
Arquivo .dmp gerado para análise.
#>

param(
    [int]$Pid = 0,
    [string]$OutDir = "C:\Temp\dumps"
)

if ($Pid -eq 0) {
    Write-Error "Informe um PID válido."
    exit 1
}

New-Item -Path $OutDir -ItemType Directory -Force | Out-Null

if (Get-Command Save-ProcessDump -ErrorAction SilentlyContinue) {
    Save-ProcessDump -Id $Pid -Path $OutDir
    Write-Host "Dump gerado em: $OutDir" -ForegroundColor Green
}
else {
    Write-Warning "Save-ProcessDump não está disponível neste sistema."
}

# Exemplo:
# .\A35_ColetarDumpProcesso.ps1 -Pid 1234 -OutDir "C:\Temp\dumps"
