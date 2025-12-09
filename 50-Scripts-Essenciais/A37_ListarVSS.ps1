<#
A37 — Listar Shadow Copies (VSS)
Objetivo: Exibir pontos de restauração do sistema (Shadow Copies).

Descrição:
Usa o comando nativo vssadmin para listar snapshots.

Parâmetros:
Nenhum.

Resultado esperado:
Lista de snapshots existentes.
#>

try {
    vssadmin list shadows
}
catch {
    Write-Warning "Falha ao executar vssadmin."
}

# Exemplo:
# .\A37_ListarVSS.ps1
