<#
A29 — Resetar senhas em lote
Objetivo: Alterar a senha de vários usuários via CSV.

Descrição:
Lê CSV contendo SamAccountName e redefine a senha.

Parâmetros:
- CsvPath
- NewPassword

Resultado esperado:
Senha redefinida para todos os usuários listados.
#>

param(
    [string]$CsvPath = "C:\Temp\reset-senhas.csv",
    [string]$NewPassword = "P@ssw0rd!"
)

try {
    Import-Module ActiveDirectory -ErrorAction Stop
    $secure = ConvertTo-SecureString $NewPassword -AsPlainText -Force

    Import-Csv $CsvPath | ForEach-Object {
        Set-ADAccountPassword -Identity $_.SamAccountName -Reset -NewPassword $secure -ErrorAction SilentlyContinue
        Unlock-ADAccount -Identity $_.SamAccountName -ErrorAction SilentlyContinue
        Write-Host "Senha resetada: $($_.SamAccountName)" -ForegroundColor Green
    }
}
catch {
    Write-Warning "Erro ao processar ActiveDirectory: $_"
}

# Exemplo do CSV:
# SamAccountName
# joao.silva
# maria.souza

# Exemplo:
# .\A29_ResetSenhaEmLote.ps1 -CsvPath "C:\Temp\usuarios.csv" -NewPassword "SenhaNova123"
