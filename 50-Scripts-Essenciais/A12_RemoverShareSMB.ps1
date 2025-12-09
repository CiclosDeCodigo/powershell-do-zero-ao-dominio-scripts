<#
A12 — Remover compartilhamento SMB
Objetivo: Remover um compartilhamento SMB existente.

Descrição:
Verifica se o compartilhamento existe antes de remover, evitando erro.

Parâmetros:
- ShareName

Resultado esperado:
Compartilhamento removido ou notificação de que não existe.
#>

param([string]$ShareName = "Comum")

if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
    Remove-SmbShare -Name $ShareName -Force
    Write-Host "Compartilhamento removido: $ShareName" -ForegroundColor Green
} else {
    Write-Host "Compartilhamento '$ShareName' não encontrado." -ForegroundColor Yellow
}

# Exemplo:
# .\A12_RemoverShareSMB.ps1 -ShareName "TI"
