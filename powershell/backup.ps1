# backup.ps1
# Det här skriptet kopierar mina filer till mappen backup.
# Jag kör skriptet från projektmappen (backup-projekt).

$kalla = "viktiga_filer" # mappen jag vill ta backup på
$backup = "backup"       # mappen där kopiorna hamnar

# om mappen inte finns har man glömt att köra terraform
if (-not (Test-Path $kalla)) {
    Write-Host "FEL: Mappen viktiga_filer finns inte. Kör terraform apply först."
    exit
}

# skapa backup-mappen om den inte finns
if (-not (Test-Path $backup)) {
    New-Item -ItemType Directory -Path $backup | Out-Null # Out-Null gör att den inte skriver ut massa text
}

# kopiera filerna, om det blir fel hamnar man i catch
try {
    Copy-Item -Path "$kalla\*" -Destination $backup -ErrorAction Stop
    Write-Host "Backup klar!"
    Add-Content -Path "logg.txt" -Value "$(Get-Date) Backup klar" # skriver en rad i loggen
}
catch {
    Write-Host "FEL: Backupen misslyckades"
}
