<# 
A5 — Substituir texto em arquivos .txt
Objetivo: Alterar conteúdo em massa dentro de arquivos .txt substituindo um texto antigo por outro.

Descrição:
Percorre todos os arquivos .txt da pasta alvo e substitui texto.  
Funciona tanto para pequenas quanto grandes quantidades de arquivos.

Parâmetros:
- Path
- Old
- New
- DryRun

Resultado esperado:
Arquivos atualizados ou listagem de arquivos que seriam alterados.
#>

param(
    [string]$Path = "C:\Temp",
    [string]$Old = "antigo",
    [string]$New = "novo",
    [switch]$DryRun
)

if (-not (Test-Path $Path)) {
    Write-Error "Pasta não encontrada: $Path"
    exit 1
}

$files = Get-ChildItem -Path $Path -Recurse -File -Filter *.txt

foreach ($file in $files) {
    $content = Get-Content -Raw -Path $file.FullName

    if ($content -match [regex]::Escape($Old)) {
        if ($DryRun) {
            Write-Host "Alteraria: $($file.FullName)"
        } else {
            $newContent = $content -replace [regex]::Escape($Old), $New
            Set-Content -Path $file.FullName -Value $newContent
            Write-Host "Atualizado: $($file.FullName)"
        }
    }
}

# Exemplo:
# .\A5_SubstituirTextoEmTxt.ps1 -Path "C:\Contratos" -Old "empresa antiga" -New "nova empresa"
