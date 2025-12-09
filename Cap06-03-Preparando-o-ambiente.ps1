#################################
$Path = "C:\Temp"
Get-ChildItem -Path $Path -Force | Remove-Item -Recurse -Force

#################################
$Path = "C:\Temp"
$Compartilhamentos = "Financeiro","Projetos","TI","RH","Comum", "Marketing", "Juridico", "Operacional", "Diretoria","Compliance"

foreach ($comp in $Compartilhamentos) {
    New-Item -Path "$path\$comp" -ItemType Directory -Force
}

#################################
# Caminho base onde estão as pastas
$BasePath = "C:\Temp"

# Lista somente as pastas imediatas
$Folders = Get-ChildItem -Path $BasePath -Directory

foreach ($Folder in $Folders) {

    # Nome do compartilhamento será o nome da pasta
    $ShareName = $Folder.Name

    # Caminho completo da pasta a ser compartilhada
    $FolderPath = $Folder.FullName

    # Verifica se o compartilhamento já existe (evita erro)
    if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
        Write-Host "O compartilhamento '$ShareName' já existe. Ignorando..." -ForegroundColor Yellow
        continue
    }

    # Criação do compartilhamento
    New-SmbShare -Name $ShareName -Path $FolderPath -FullAccess "Todos"
}

#################################
Get-SmbShare |
    Where-Object { $_.Path -like "C:\Temp\*" } |
    Select-Object Name, Path

#################################
# ==============================
# GERADOR AVANÇADO DE MASSA DE ARQUIVOS
# ==============================

param(
    [Parameter(Mandatory)]
    [string]$BasePath,

    [int]$Depth = 2,                      # Profundidade de subpastas
    [int]$FoldersPerLevel = 5,            # Quantidade de subpastas em cada nível
    [int]$FilesPerFolder = 20,            # Arquivos criados em cada pasta
    [int]$MinSizeKB = 10,                 # Tamanho mínimo dos arquivos
    [int]$MaxSizeKB = 300,                # Tamanho máximo dos arquivos
    [string[]]$Extensions = @("pdf","docx","xlsx","txt","csv")  # Extensões válidas
)

# --- Criação segura do caminho-base
if (-not (Test-Path $BasePath)) {
    New-Item -Path $BasePath -ItemType Directory | Out-Null
}

# --- Conteúdos binários mínimos (headers válidos)
$FileHeaders = @{
    "pdf"  = [byte[]]([System.Text.Encoding]::ASCII.GetBytes("%PDF-1.1`n"))
    "docx" = [byte[]](0x50,0x4B,0x03,0x04)   # ZIP header
    "xlsx" = [byte[]](0x50,0x4B,0x03,0x04)   # ZIP header
    "txt"  = [byte[]]([System.Text.Encoding]::UTF8.GetBytes("Arquivo de teste`n"))
    "csv"  = [byte[]]([System.Text.Encoding]::UTF8.GetBytes("col1,col2,col3`n"))
}

function New-RandomFile {
    param(
        [string]$Path,
        [string]$Extension,
        [int]$MinKB,
        [int]$MaxKB
    )

    $FullPath = Join-Path $Path ("File_{0}.{1}" -f ([guid]::NewGuid().ToString()), $Extension)
    $SizeBytes = (Get-Random -Minimum ($MinKB*1024) -Maximum ($MaxKB*1024))

    $Header = $FileHeaders[$Extension]
    $RemainingSize = [math]::Max(0, $SizeBytes - $Header.Length)

    # Geração do arquivo binário
    $fs = [System.IO.File]::OpenWrite($FullPath)
    $fs.Write($Header, 0, $Header.Length)

    if ($RemainingSize -gt 0) {
        $buffer = New-Object byte[] 8192
        $Written = 0

        while ($Written -lt $RemainingSize) {
            $ToWrite = [math]::Min($buffer.Length, $RemainingSize - $Written)
            $fs.Write($buffer, 0, $ToWrite)
            $Written += $ToWrite
        }
    }

    $fs.Close()
    return $FullPath
}

function New-Subtree {
    param(
        [string]$CurrentPath,
        [int]$Level
    )

    if ($Level -eq 0) { return }

    for ($i=1; $i -le $FoldersPerLevel; $i++) {

        $Folder = Join-Path $CurrentPath ("Folder_{0}_{1}" -f $Level, $i)
        New-Item -Path $Folder -ItemType Directory | Out-Null

        # Criar arquivos na pasta atual
        for ($f=1; $f -le $FilesPerFolder; $f++) {
            $ext = Get-Random -InputObject $Extensions
            New-RandomFile -Path $Folder -Extension $ext -MinKB $MinSizeKB -MaxKB $MaxSizeKB | Out-Null
        }

        # Recursão
        New-Subtree -CurrentPath $Folder -Level ($Level - 1)
    }
}

Write-Host "Iniciando geração de estrutura em $BasePath ..."
New-Subtree -CurrentPath $BasePath -Level $Depth
Write-Host "Finalizado!"

#################################
#Compliance
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Compliance" `
    -Depth 1 `
    -FoldersPerLevel 2 `
    -FilesPerFolder 5 `
    -MinSizeKB 50 `
    -MaxSizeKB 500 `
    -Extensions @("pdf","docx","xlsx")

#Comum
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Comum" `
    -Depth 1 `
    -FoldersPerLevel 10 `
    -FilesPerFolder 1000 `
    -MinSizeKB 50 `
    -MaxSizeKB 500 `
    -Extensions @("csv","txt")

#Diretoria
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Diretoria" `
    -Depth 1 `
    -FoldersPerLevel 5 `
    -FilesPerFolder 30 `
    -MinSizeKB 50 `
    -MaxSizeKB 500 `
    -Extensions @("pdf","docx","xlsx")

#Financeiro
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Financeiro" `
    -Depth 1 `
    -FoldersPerLevel 10 `
    -FilesPerFolder 300 `
    -MinSizeKB 50 `
    -MaxSizeKB 600 `
    -Extensions @("xlsx")

#Juridico
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Juridico" `
    -Depth 1 `
    -FoldersPerLevel 10 `
    -FilesPerFolder 250 `
    -MinSizeKB 200 `
    -MaxSizeKB 2000 `
    -Extensions @("pdf")

#Marketing
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Marketing" `
    -Depth 1 `
    -FoldersPerLevel 2 `
    -FilesPerFolder 10 `
    -MinSizeKB 1000 `
    -MaxSizeKB 2000 `
    -Extensions @("pdf", "docx")

#Operacional
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Operacional" `
    -Depth 1 `
    -FoldersPerLevel 10 `
    -FilesPerFolder 600 `
    -MinSizeKB 1000 `
    -MaxSizeKB 2000 `
    -Extensions @("csv","txt")

#Projetos
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\Projetos" `
    -Depth 1 `
    -FoldersPerLevel 1 `
    -FilesPerFolder 3 `
    -MinSizeKB 1000 `
    -MaxSizeKB 2000 `
    -Extensions @("pdf")

#RH
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\RH" `
    -Depth 1 `
    -FoldersPerLevel 5 `
    -FilesPerFolder 3 `
    -MinSizeKB 100 `
    -MaxSizeKB 2000 `
    -Extensions @("pdf", "docx", "xlsx")

#TI
.\gerar-massa-de-dados.ps1 `
    -BasePath "C:\Temp\TI" `
    -Depth 1 `
    -FoldersPerLevel 4 `
    -FilesPerFolder 30 `
    -MinSizeKB 100 `
    -MaxSizeKB 2000 `
    -Extensions @("pdf", "docx", "xlsx", "txt", "csv")
