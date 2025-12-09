<#
A50 — Limpar cache DNS (Flush)
Objetivo: Executar limpeza do cache DNS local para atualização de resolução.

Descrição:
Invoca ipconfig /flushdns e confirma sucesso.

Parâmetros:
Nenhum.

Resultado esperado:
Mensagem confirmando que cache DNS foi limpo.
#>

try {
    ipconfig /flushdns | Out-Null
    Write-Host "Cache DNS limpo com sucesso." -ForegroundColor Green
}
catch {
    Write-Warning "Falha ao limpar cache DNS: $_"
}

# Exemplo:
# .\A50_FlushDNS.ps1
