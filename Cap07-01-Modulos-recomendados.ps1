#################################
Install-Module Pester

#################################
Describe "Teste de exemplo" {
    It "Deve retornar verdadeiro" {
        $true | Should -Be $true
    }
}

#################################
Install-Module Az

#################################
Install-WindowsFeature RSAT-AD-PowerShell
Get-ADUser -Filter * | Select Name, Department

#################################
Install-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName admin@dominio.com
Get-Mailbox

#################################
Install-Module Microsoft.Graph

#################################
Install-Module PSReadLine -Force

#################################
Install-Module ImportExcel
Get-Process | Export-Excel "Processos.xlsx" -AutoSize

#################################
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll -AutoReboot

#################################
Install-Module Posh-SSH
New-SSHSession -ComputerName 192.168.1.10 -Credential (Get-Credential)
Invoke-SSHCommand -Command "ls /home"

#################################
Install-Module VMware.PowerCLI
Connect-VIServer -Server vcenter.local
Get-VM

#################################
Install-Module ChocolateyGet
Find-Package | Install-Package

#################################
Install-Module oh-my-posh

#################################
Install-Module PSFramework