#################################
$dia = "terça"
switch ($dia) {
    "segunda" { "Início da semana" }
    "terça"   { "Reunião de equipe" }
    "quarta"  { "Metade da semana" }
    "sexta"   { "Quase fim de semana" }
    default   { "Dia comum" }
}

#################################
$valores = 1, 2, 3, 4, 5
switch ($valores) {
    1 { "Um" }
    3 { "Três" }
    5 { "Cinco" }
}
