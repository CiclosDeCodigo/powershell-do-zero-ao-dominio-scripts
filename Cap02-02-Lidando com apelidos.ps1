function Remove-AcentosESanitiza {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Texto,

        [switch]$LowerCase
    )

    # 1. Normaliza para decompor acentos
    $formD = $Texto.Normalize([Text.NormalizationForm]::FormD)

    # 2. Remove acentos
    $semAcento = ($formD.ToCharArray() | Where-Object {
        [Globalization.CharUnicodeInfo]::GetUnicodeCategory($_) -ne `
        [Globalization.UnicodeCategory]::NonSpacingMark
    }) -join ""

    # 3. Substitui espaços por hífen
    $resultado = $semAcento -replace "\s+", "-"

    # 4. Remove qualquer caractere que não seja letra, número ou hífen
    $resultado = $resultado -replace "[^a-zA-Z0-9\-]", ""

    # 5. **Converte tudo para minúsculas por último**
    if ($LowerCase.IsPresent) {
        $resultado = $resultado.ToLower()
    }

    return $resultado
}


New-ScriptsFromList `
    -ArquivoTxt "C:\Temp\lista.txt" `
    -Destino    "C:\Temp\ScriptsGerados"
