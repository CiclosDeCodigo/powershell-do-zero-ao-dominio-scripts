<#
A18 — Verificar status do BitLocker
Objetivo: Consultar criptografia do volume.

Descrição:
Mostra se o drive está criptografado, descriptografado ou parcialmente processado.

Parâmetros:
- DriveLetter

Resultado esperado:
Status claro do BitLocker.
#>

param([string]$DriveLetter = "C:")

try {
    $info = Get-BitLockerVolume -MountPoint $DriveLetter -ErrorAction Stop

    Write-Host "Status BitLocker:" -ForegroundColor Cyan
    Write-Host "Volume: $DriveLetter"
    Write-Host "Status: $($info.VolumeStatus)"
    Write-Host "Proteção: $($info.ProtectionStatus)"
}
catch {
    Write-Warning "Get-BitLockerVolume não está disponível neste sistema."
}

# Exemplo:
# .\A18_HabilitarBitLockerCheck.ps1 -DriveLetter "D:"
