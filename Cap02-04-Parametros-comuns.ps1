#################################
Copy-Item -Path "C:\Temp\notas1.txt" -Destination "C:\Temp\notas2.txt" -Verbose

#################################
Copy-Item -Path "C:\Temp\notas1.txt" -Destination "C:\Temp\notas2.txt" -Debug

#################################
Get-Item "C:\Temp\arquivo_que_nao_existe.txt" -ErrorAction SilentlyContinue

#################################
Get-Item "C:\x.txt" -ErrorVariable ev -ErrorAction SilentlyContinue
$ev

#################################
Get-Process -OutVariable proc
$proc.Count
