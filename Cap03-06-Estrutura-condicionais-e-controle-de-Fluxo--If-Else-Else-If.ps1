#################################
$idade = 20

if ($idade -ge 18) {
    Write-Host "Maior de idade"
}

#################################
$nota = 55

if ($nota -ge 60) {
    Write-Host "Aprovado"
} else {
    Write-Host "Reprovado"
}

#################################
$temperatura = 32

if ($temperatura -ge 40) {
    Write-Host "Muito quente"
}
elseif ($temperatura -ge 25) {
    Write-Host "Clima agradável"
}
else {
    Write-Host "Frio"
}

#################################
$idade = Read-Host "Digite sua idade"

if ($idade -lt 12) {
    Write-Host "Criança"
}
elseif ($idade -lt 18) {
    Write-Host "Adolescente"
}
else {
    Write-Host "Adulto"
}
