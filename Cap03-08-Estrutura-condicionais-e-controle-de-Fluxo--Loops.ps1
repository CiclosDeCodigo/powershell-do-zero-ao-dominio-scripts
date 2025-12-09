#################################
$service = "Spooler"
$status = (Get-Service $service).Status

Write-Host "Iniciando a validação do serviço $service"

while ($status -ne "Running") {
    Write-Host "Aguardando o serviço $service iniciar..."
    Start-Sleep -Seconds 2
    $status = (Get-Service $service).Status
}

Write-Host "Serviço $service está executando"

#################################
do {
    $senha = Read-Host "Digite a senha"
} while ($senha -ne "1234")
Write-Host "Acesso concedido!"

#################################
do {
    Write-Host "Aguardando o arquivo aparecer..."
    Start-Sleep -Seconds 3
} until (Test-Path "C:\Temp\relatorio.csv")
Write-Host "Arquivo encontrado!"

#################################
for ($i = 1; $i -le 10; $i++) {
    Write-Host "Executando tentativa $i"
}

#################################
$numeros = @(10, 25, 8, 42, 15, 3)
for ($i = 0; $i -lt $numeros.Count; $i++) {
    $valor = $numeros[$i]
    Write-Host "Analisando posição $i → Valor: $valor"

    if ($valor -gt 20 -and $valor -lt 40) {
        Write-Host " → O número $valor está entre 21 e 39." -ForegroundColor Yellow
    }
    elseif ($valor -ge 40) {
        Write-Host " → O número $valor é 40 ou maior!" -ForegroundColor Red
    }
    else {
        Write-Host " → O número $valor é menor ou igual a 20." -ForegroundColor Green
    }
    Write-Host ""
}

#################################
# Caminho raiz
$raiz = "C:\Temp"

# Lista apenas as subpastas imediatas
Get-ChildItem -Path $raiz -Directory | ForEach-Object {

    $pasta = $_.FullName

    # Lista todos os arquivos dentro da pasta (modo recursivo)
    $arquivos = Get-ChildItem -Path $pasta -File -Recurse -ErrorAction SilentlyContinue

    # Conta os arquivos
    $quantidade = $arquivos.Count

    # Soma o tamanho total em bytes
    $tamanhoTotalBytes = ($arquivos | Measure-Object -Property Length -Sum).Sum

    # Converte para MB de forma legível
    $tamanhoMB = [Math]::Round($tamanhoTotalBytes / 1MB, 2)

    # Exibe resultado formatado
    [PSCustomObject]@{
        Pasta = $_.Name
        Caminho = $pasta
        'Total de Arquivos' = $quantidade
        'Tamanho Total (MB)' = $tamanhoMB
    }
}

#################################
for ($i = 1; $i -le 10; $i++) {
    if ($i -eq 3) { continue } # pula o 3
    if ($i -eq 5) { break }    # para antes do 5
    Write-Host "Número: $i"
}
