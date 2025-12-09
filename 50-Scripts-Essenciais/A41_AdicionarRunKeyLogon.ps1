<#
A41 — Adicionar RunKey no logon
Objetivo: Executar automaticamente um script no logon do usuário.

Descrição:
Adiciona uma entrada no registro em HKCU:\Software\Microsoft\Windows\CurrentVersion\Run
apontando para um script .ps1 com ExecutionPolicy Bypass.

Parâmetros:
- Name
- Path

Resultado esperado:
Aplicação adicionada ao logon.
#>

param(
    [string]$Name = "MeuScript",
    [string]$Path = "C:\Scripts\script.ps1"
)

Set-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name $Name `
    -Value "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$Path`""

Write-Host "Chave de execução adicionada ao logon." -ForegroundColor Green

# Exemplo:
# .\A41_AdicionarRunKeyLogon.ps1 -Name "BackupAuto" -Path "C:\Scripts\backup.ps1"
