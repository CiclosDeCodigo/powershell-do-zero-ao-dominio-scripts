#################################
Find-Module -Name Pester

#################################
Install-Module -Name Pester -Scope CurrentUser

#################################
Install-Module -Name Pester -Scope CurrentUser -Force

#################################
Get-Module Pester -ListAvailable | Select-Object name, version

#################################
Uninstall-Module -Name Pester