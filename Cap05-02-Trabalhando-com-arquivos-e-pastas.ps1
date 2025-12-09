#################################
Get-ChildItem

#################################
Get-ChildItem -Recurse

#################################
Get-ChildItem C:\Temp

#################################
Get-ChildItem C:\Temp -Recurse -Filter *.log

#################################
Get-ChildItem C:\Temp -File -Recurse | Measure-Object -Property Length -Sum

#################################
Get-ChildItem C:\Temp -File -Recurse | Select-Object Directory, name, Extension, Length

#################################
Get-ChildItem C:\Temp -File -Recurse
| Select-Object Directory, name, Extension, Length 
| Export-Csv "C:\temp\arquivos.csv" -NoTypeInformation -Encoding UTF8BOM

#################################
Get-Item C:\Temp\Arquivo.txt

#################################
New-Item -Path C:\Temp\NovaPasta -ItemType Directory

#################################
New-Item -Path C:\Temp\Notas.txt -ItemType File

#################################
Set-Content C:\Temp\Notas.txt -Value "Teste1"

#################################
Get-Content C:\Temp\Notas.txt

#################################
Test-Path C:\Temp\Notas.txt

#################################
Remove-Item C:\Temp\Notas.txt

#################################
Cannot find path 'C:\Temp\Notas.txt' because it does not exist.

#################################
Remove-Item C:\temp\ -Recurse -Force

#################################
Get-ChildItem "C:\Temp" -Force | Remove-Item -Recurse -Force

#################################
Invoke-Item C:\Temp\Notas.txt

#################################
Compress-Archive -Path C:\Temp\* -DestinationPath C:\temp\Temp.zip

#################################
Compress-Archive -Path C:\Temp\*.log -DestinationPath C:\temp\Logs.zip

#################################
Expand-Archive -Path C:\Temp\Temp.zip -DestinationPath C:\Temp\
