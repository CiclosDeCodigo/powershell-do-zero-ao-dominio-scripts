<#
A23 — Alerta de espaço em disco
Objetivo: Emitir alerta por e-mail quando o disco estiver abaixo do limite.

Descrição:
Verifica o espaço livre da unidade e dispara e-mail se abaixo do threshold.

Parâmetros:
- Drive
- ThresholdGB
- Smtp
- To
- From

Resultado esperado:
Mensagem no console e possível envio de e-mail.
#>

param(
    [string]$Drive = "C:",
    [int]$ThresholdGB = 10,
    [string]$Smtp = "",
    [string]$To = "",
    [string]$From = "alert@local"
)

$letter = $Drive.TrimEnd(":")
$driveInfo = Get-PSDrive -Name $letter -ErrorAction SilentlyContinue

if (-not $driveInfo) {
    Write-Error "Drive não encontrado: $Drive"
    exit 1
}

$freeGB = [math]::Round($driveInfo.Free / 1GB, 2)

Write-Host "Espaço livre em $Drive: $freeGB GB" -ForegroundColor Cyan

if ($freeGB -lt $ThresholdGB) {

    Write-Warning "Espaço crítico abaixo de $ThresholdGB GB!"

    if ($Smtp -and $To) {
        Send-MailMessage -SmtpServer $Smtp -From $From -To $To `
            -Subject "Alerta: Baixo espaço em disco ($Drive)" `
            -Body "Espaço livre: $freeGB GB"

        Write-Host "Alerta enviado para $To" -ForegroundColor Green
    } else {
        Write-Warning "SMTP e destinatário não configurados. Nenhum e-mail foi enviado."
    }
}
else {
    Write-Host "Espaço dentro do normal." -ForegroundColor Green
}

# Exemplo:
# .\A23_AlertaEspacoDisco.ps1 -Drive "D:" -ThresholdGB 15 -Smtp "smtp.meu.com" -To "ti@empresa.com"
