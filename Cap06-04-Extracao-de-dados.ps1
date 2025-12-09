#################################
Get-SmbShare -CimSession "LOCALHOST" |
    Where-Object { $_.Name -notmatch '\$$' } |
    ForEach-Object {
        "\\$($_.PSComputerName)\$($_.Name)"
    }

#################################
# Config
$inputFile  = "C:\Temp\compartilhamentos.txt"
$outputFile = "C:\Temp\auditoria-compartilhamentos.csv"

# Lê o arquivo de compartilhamentos.
$compartilhamentos = Get-Content -Path $inputFile | Where-Object { $_.Trim() -ne "" }

# Preparar lista de resultados que será exportada para CSV no final.
$resultados = [System.Collections.Generic.List[PSObject]]::new()

foreach ($share in $compartilhamentos) {

    $shareTrim = $share.Trim()

    # Verifica se o caminho UNC existe e está acessível. Se não estiver, registra um warning e pula.
    if (-not (Test-Path $shareTrim)) {
        Write-Warning "Compartilhamento inacessível ou não encontrado: $shareTrim"
        continue
    }

    # Obtém as pastas imediatas no nível do share.
    $pastasImediatas = Get-ChildItem -Path $shareTrim -Directory -ErrorAction SilentlyContinue

    foreach ($pasta in $pastasImediatas) {

        # Contar todos os arquivos recursivamente e somar o tamanho em bytes.
        $arquivos = Get-ChildItem -Path $pasta.FullName -File -Recurse -ErrorAction SilentlyContinue

        $quantidade = $arquivos.Count
        $espacoMB = 0
        if ($quantidade -gt 0) {
            $espacoMB = [math]::Round(($arquivos | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
        }

        $obj = [PSCustomObject]@{
            Compartilhamento   = $shareTrim
            PastaImediata      = $pasta.Name
            QuantidadeArquivos = $quantidade
            EspacoMB           = $espacoMB
        }
        $resultados.Add($obj)
    }
}

# Exporta todos os resultados para CSV.
$resultados | Export-Csv -Path $outputFile -NoTypeInformation -Encoding UTF8
Write-Host "Processo finalizado"

Saída:
Processo finalizado
