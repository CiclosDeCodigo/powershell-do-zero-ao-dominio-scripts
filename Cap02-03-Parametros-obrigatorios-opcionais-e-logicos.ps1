#################################
New-Item -Path "C:\Temp\Teste.txt" -ItemType File

#################################
Get-Process -Name "notepad"

#################################
Get-ChildItem -Path "C:\Windows" -Recurse

#################################
Get-Service -DisplayName "Windows Update"

#################################
Get-Process notepad

#################################
New-Item "C:\Temp\Teste2.txt”

#################################
Get-ChildItem -Path "C:\Windows" -Filter "*.exe"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
