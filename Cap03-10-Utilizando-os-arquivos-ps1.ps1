#################################
Write-Host "Olá, mundo do PowerShell!"

#################################
Get-ExecutionPolicy

#################################
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

#################################
Set-Location C:\PS-Scripts
.\OlaMundo.ps1

#################################
C:\PS-Scripts\Olamundo.ps1

#################################
function Dizer-Ola {
    param($Nome)
    Write-Host "Olá, $Nome!"
}

#################################
. .\Funcoes.ps1
Dizer-Ola -Nome "João"
