<#
A14 — Listar sessões SMB ativas
Objetivo: Ver quem está conectado aos compartilhamentos.

Descrição:
Mostra sessões abertas, computadores, usuários e identificadores.

Parâmetros:
Nenhum.

Resultado esperado:
Lista de sessões SMB.
#>

if (Get-Command Get-SmbSession -ErrorAction SilentlyContinue) {
    Get-SmbSession |
        Select-Object ClientComputerName,ClientUserName,NumOpens,SessionId |
        Format-Table -AutoSize
} else {
    Write-Warning "Get-SmbSession não está disponível neste sistema."
}

# Exemplo:
# .\A14_ListarSessoesSMB.ps1
