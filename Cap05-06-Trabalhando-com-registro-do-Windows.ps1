#################################
Get-ItemProperty -Path "HKCU:\Control Panel\Desktop"

#################################
Get-ItemPropertyValue -Path "HKCU:\Control Panel\Desktop" -Name ScreenSaveActive

#################################
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name MenuShowDelay -Value "200"

#################################
Get-ItemPropertyValue -Path "HKCU:\Control Panel\Desktop" -Name MenuShowDelay

#################################
New-Item -Path "HKCU:\Software" -Name "PSTraining" -Force

#################################
New-ItemProperty -Path "HKCU:\Software\PSTraining" -Name "Autor" -Value "Teste PowerShell" -PropertyType String
New-ItemProperty -Path "HKCU:\Software\PSTraining" -Name "Versao" -Value 1 -PropertyType DWord

#################################
Remove-ItemProperty -Path "HKCU:\Software\PSTraining" -Name "Versao"

#################################
Remove-Item -Path "HKCU:\Software\PSTraining" -Recurse