<#
A28 — Criar usuário no Active Directory
Objetivo: Demonstrar criação de contas no AD.

Descrição:
Cria uma conta simples com senha e habilita o usuário.

Parâmetros:
- Name
- Sam
- Password
- Path

Resultado esperado:
Criação do usuário no domínio.
#>

param(
    [string]$Name = "Teste Usuario",
    [string]$Sam = "teste.usuario",
    [string]$Password = "P@ssw0rd!",
    [string]$Path = "CN=Users,DC=corp,DC=local"
)

try {
    Import-Module ActiveDirectory -ErrorAction Stop

    $secure = ConvertTo-SecureString $Password -AsPlainText -Force
    New-ADUser -Name $Name -SamAccountName $Sam -AccountPassword $secure `
               -Enabled $true -Path $Path

    Write-Host "Usuário criado com sucesso: $Sam" -ForegroundColor Green
}
catch {
    Write-Warning "Erro ao criar usuário: $_"
}

# Exemplo:
# .\A28_CriarUsuarioADExemplo.ps1 -Name "Mario Silva" -Sam "mario.silva"
