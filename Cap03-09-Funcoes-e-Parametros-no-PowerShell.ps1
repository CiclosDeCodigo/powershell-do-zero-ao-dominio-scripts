#################################
function Dizer-Ola {
    Write-Host "Olá"
}
Dizer-Ola

#################################
function Somar-Numeros {
    param($a, $b)
    return ($a + $b)
}

Somar-Numeros 3 2
Somar-Numeros -a 1 -b 2

#################################
function Dizer-Ola {
    param($nome)
    Write-Host "Olá $nome"
}
Dizer-Ola -nome "Joaquim"

#################################
function Dizer-Ola {
    param(
    [Parameter(Mandatory=$true)]
    [string]$nome
    )
    Write-Host "Olá $nome"
}

Dizer-Ola "Joaquim"

#################################
function Dizer-Ola {
    param(
    [string]$nome = "Visitante"
    )
    Write-Host "Olá $nome"
}

Dizer-Ola "Joaquim"
Dizer-Ola

#################################