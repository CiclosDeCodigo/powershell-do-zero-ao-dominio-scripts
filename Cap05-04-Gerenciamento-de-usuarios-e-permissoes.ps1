#################################
$password = Read-Host "Digite a senha" -AsSecureString
New-LocalUser -Name "teste01" -Password $password -FullName "Usuário de Teste" -Description "Criado via PowerShell"

#################################
Get-LocalUser

#################################
Get-LocalUser | Format-List *

#################################
Remove-LocalUser -Name "teste01"

#################################
Get-LocalGroup

#################################
Add-LocalGroupMember -Group "Administradores" -Member "teste01"

#################################
Remove-LocalGroupMember -Group "Administradores" -Member "teste01"

#################################
Get-Acl "C:\Temp"

#################################
(Get-Acl "C:\Temp").Access | Select-Object FileSystemRights, AccessControlType, IdentityReference | Format-Table

#################################
$acl = Get-Acl "C:\Temp"
$regra = New-Object System.Security.AccessControl.FileSystemAccessRule("teste01","FullControl","Allow")
$acl.AddAccessRule($regra)
Set-Acl "C:\Temp" $acl

#################################
$acl = Get-Acl "C:\Temp"
$regra = New-Object System.Security.AccessControl.FileSystemAccessRule("teste01","FullControl","Allow")
$acl.RemoveAccessRule($regra)
Set-Acl "C:\Temp" $acl


#################################
$BasePath = "C:\Temp"
$PastasImediatas = Get-ChildItem -Path $BasePath -Directory
$Resultado = foreach ($pasta in $PastasImediatas) {
    $acl = Get-Acl -Path $pasta.FullName
    foreach ($entry in $acl.Access) {
        [PSCustomObject]@{
            Pasta        = $pasta.FullName
            Identidade   = $entry.IdentityReference
            Permissao    = $entry.FileSystemRights
            Tipo         = $entry.AccessControlType
        }
    }
}
$Resultado | Export-Csv -Path "C:\Temp\permissoes.csv" -NoTypeInformation -Encoding utf8BOM
