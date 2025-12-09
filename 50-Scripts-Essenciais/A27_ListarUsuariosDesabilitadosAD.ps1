<#
A27 — Listar usuários desabilitados no AD
Objetivo: Identificar contas desabilitadas no domínio.

Descrição:
Retorna usuários com Enabled = False, útil para auditoria.

Parâmetros:
- ExportCsv (opcional)

Resultado esperado:
Lista ou arquivo CSV contendo usuários desabilitados.
#>

param([string]$ExportCsv = "")

try {
    Import-Module ActiveDirectory -ErrorAction Stop

    $users = Get-ADUser -Filter 'Enabled -eq $false' -Properties DisplayName, LastLogonDate |
        Select-Object Name, DisplayName, LastLogonDate

    if ($ExportCsv) {
        $users | Export-Csv -Path $ExportCsv -NoTypeInformation
        Write-Host "Arquivo exportado para $ExportCsv" -ForegroundColor Green
    } else {
        $users | Format-Table -AutoSize
    }
}
catch {
    Write-Warning "Módulo ActiveDirectory não disponível."
}

# Exemplo:
# .\A27_ListarUsuariosDesabilitadosAD.ps1 -ExportCsv "C:\Temp\users-disabled.csv"
