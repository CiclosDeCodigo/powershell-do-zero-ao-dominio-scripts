<#
A42 — Execução paralela com ForEach-Object -Parallel
Objetivo: Demonstrar paralelismo nativo do PowerShell 7+.

Descrição:
Conta arquivos de múltiplas pastas simultaneamente.

Parâmetros:
- Folders

Resultado esperado:
Tabela mostrando quantidade de arquivos por pasta em paralelo.
#>

param([string[]]$Folders = @("C:\Temp\A","C:\Temp\B"))

if ($PSVersionTable.PSVersion.Major -lt 7) {
    Write-Warning "Este recurso exige PowerShell 7 ou superior."
    exit 1
}

$Folders |
    ForEach-Object -Parallel {
        $count = (Get-ChildItem -Path $_ -File -Recurse -ErrorAction SilentlyContinue).Count
        [PSCustomObject]@{
            Folder = $_
            Count  = $count
        }
    } -ThrottleLimit 4 |
    Format-Table -AutoSize

# Exemplo:
# .\A42_ForEachParallelExemplo.ps1 -Folders "C:\Data1","C:\Data2"
