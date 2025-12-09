<#
A47 — Testar porta TCP
Objetivo: Verificar se uma porta TCP está aberta em um host.

Descrição:
Usa System.Net.Sockets.TcpClient para testar conectividade TCP simples dentro de timeout.

Parâmetros:
- Host
- Port
- TimeoutMs

Resultado esperado:
Imprime "Open" se porta acessível, "Closed" caso contrário.
#>

param(
    [string]$Host = "localhost",
    [int]$Port = 445,
    [int]$TimeoutMs = 2000
)

$tcp = New-Object System.Net.Sockets.TcpClient
try {
    $iar = $tcp.BeginConnect($Host,$Port,$null,$null)
    $success = $iar.AsyncWaitHandle.WaitOne($TimeoutMs,$false)
    if ($success) {
        $tcp.EndConnect($iar)
        $tcp.Close()
        Write-Host "Open - $Host:$Port" -ForegroundColor Green
    } else {
        Write-Host "Closed - $Host:$Port" -ForegroundColor Yellow
    }
}
catch {
    Write-Host "Closed - $Host:$Port" -ForegroundColor Yellow
}

# Exemplo:
# .\A47_TestarPortaTcp.ps1 -Host "server.corp" -Port 3389 -TimeoutMs 1500
