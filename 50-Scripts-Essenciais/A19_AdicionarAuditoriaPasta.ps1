<#
A19 — Adicionar auditoria NTFS
Objetivo: Habilitar auditoria de escrita e deleção numa pasta.

Descrição:
Inclui regra de auditoria permitindo rastrear atividades críticas.

Parâmetros:
- Path

Resultado esperado:
Regra de auditoria aplicada.
#>

param([string]$Path = "C:\Temp\Comum")

if (-not (Test-Path $Path)) {
    Write-Error "Caminho não encontrado."
    exit 1
}

try {
    $auditRule = New-Object System.Security.AccessControl.FileSystemAuditRule(
        "Everyone",
        "Write,Delete",
        "None",
        "Success"
    )

    $acl = Get-Acl $Path
    $acl.AddAuditRule($auditRule)
    Set-Acl -Path $Path -AclObject $acl

    Write-Host "Regra de auditoria adicionada com sucesso." -ForegroundColor Green
}
catch {
    Write-Error "Erro ao adicionar auditoria: $_"
}

# Exemplo:
# .\A19_AdicionarAuditoriaPasta.ps1 -Path "C:\Documentos"
