#################################
$Teste = "Olá Mundo"
$Teste.GetType()

$Teste = 42
$Teste.GetType()

$Teste = 1234567890123
$Teste.GetType()

$Teste = 3.14
$Teste.GetType()

$Teste = $true
$Teste.GetType()

$Teste = 'A'
$Teste.GetType()

#################################
$Teste = @(1,2,3)
$Teste.gettype()
$Teste = @{Nome="João"; Idade=30}
$Teste.gettype()
$Teste = [PSCustomObject]@{Nome="Maria"; Cidade="SP"}
$Teste.gettype()

#################################
$aniversario = [datetime]"1995-08-21"
$aniversario

#################################
$xml = [xml]@"
<usuarios>
    <usuario nome="João" idade="30" />
    <usuario nome="Maria" idade="25" />
</usuarios>
"@

$xml.usuarios.usuario

#################################
$regex = [regex]"\d{3}-\d{2}-\d{4}"
$regex.IsMatch("123-45-6789")
$regex.IsMatch("ABC-12-9999")

#################################
$regex = [regex]"\d+"
$regex.Matches("O pedido 123 custou 456 reais")

#################################
$id = [guid]::NewGuid()
$id
$id = [guid]::NewGuid()
$id

#################################
$file = Get-Item "C:\Windows\notepad.exe"
$file.GetType()  # Retorna System.IO.FileInfo

#################################
[int]$idade = "30"       # Converte string para inteiro
[string]$nome = 123      # Converte inteiro para string
