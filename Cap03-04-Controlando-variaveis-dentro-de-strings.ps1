#################################
$nome = "João"
$mensagem = "Olá, $nome!"
Write-Output $mensagem

#################################
$nome = "João"
$mensagem = 'Olá, $nome!'
Write-Output $mensagem

#################################
$nome = "Maria"
$mensagem = "Ela disse: 'Olá, $nome!'"
Write-Output $mensagem

#################################
$nomes = @("Ana","Bruno","Carlos")
$mensagem = "Os nomes são: $($nomes -join ', ')"
Write-Output $mensagem
