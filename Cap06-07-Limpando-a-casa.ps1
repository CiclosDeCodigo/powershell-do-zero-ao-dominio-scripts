#################################
$Compartilhamentos = "Financeiro","Projetos","TI","RH","Comum", "Marketing", "Juridico", "Operacional", "Diretoria","Compliance"

foreach ($share in $compartilhamentos) {
    Remove-SmbShare $share
}

#################################
$Path = "C:\Temp"
Get-ChildItem -Path $Path -Force | Remove-Item -Recurse -Force
