#################################
Invoke-WebRequest https://www.microsoft.com/

#################################
$usuarios = Invoke-RestMethod -Uri "https://jsonplaceholder.typicode.com/users" -Method Get
$usuarios | Select-Object name, email

#################################
# Preparando os dados
$novoPost = @{
    title = "Novo post de exemplo"
    body = "Nosso conteudo !!"
    userId = 1
} | ConvertTo-Json

# Enviando para a API
$resposta = Invoke-RestMethod -Uri "https://jsonplaceholder.typicode.com/posts" `
    -Method Post `
    -Body $novoPost `
    -ContentType "application/json"

$resposta
