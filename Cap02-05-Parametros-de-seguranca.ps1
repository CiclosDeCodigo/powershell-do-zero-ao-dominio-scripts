#################################
Remove-Item "C:\Temp\teste.txt" -WhatIf

#################################
Remove-Item "C:\Temp\teste.txt" -Confirm

#################################
Clear-RecycleBin

#################################
Clear-RecycleBin -Confirm:$false #Esse comando é executado ignorando a confirmação.
