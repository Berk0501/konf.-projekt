# Enkel backup med Terraform, PowerShell och Python

Projekt i kursen *Infrastruktur konfigurering och deployment med programmering*.

**GitHub:** https://github.com/DITT-ANVÄNDARNAMN/DITT-REPO  <!-- byt ut mot din länk -->

## Vad gör projektet?

Projektet tar en backup (kopia) av några viktiga filer och kollar sedan att backupen blev rätt.

```
Terraform  ->  PowerShell  ->  Python
skapar filer   kopierar dem    kollar backupen
```

1. **Terraform** skapar mappen `viktiga_filer` med 3 textfiler.
2. **PowerShell** kopierar filerna till mappen `backup` och skriver en rad i `logg.txt`.
3. **Python** kollar att alla filer finns i `backup`.

Projektet bygger på lärarens **Exempel A** (Terraform skapar filer, PowerShell gör en administrativ
uppgift). Jag har lagt till Python som kontrollerar resultatet, som i **Exempel 7**.

## Varför de här verktygen?

- **Terraform**: Infrastructure as Code. Man skriver i kod vad som ska finnas och Terraform skapar det.
  Jag använder providern `local` som skapar filer på datorn, så jag behöver inget molnkonto.
- **PowerShell**: finns i Windows och är bra på att hantera filer.
- **Python**: enkelt att skriva en kontroll med modulen `os`.

Jag valde backup för att det är en vanlig uppgift som är lätt att glömma om man gör den för hand.

## Filer

```
├── README.md
├── .gitignore
├── terraform/
│   ├── main.tf          provider och resource (skapar filerna)
│   ├── variables.tf     variabeln antal_filer
│   └── outputs.tf       visar vilka filer som skapades
├── powershell/
│   └── backup.ps1       kopierar filerna till backup
└── python/
    └── verifiera.py     kollar att backupen är rätt
```

`viktiga_filer/`, `backup/` och `logg.txt` skapas när man kör projektet.

## Krav

- Windows med PowerShell
- Terraform
- Python 3

## Så här kör man

Öppna en terminal i mappen `backup-projekt`.

**1. Terraform**
```powershell
cd terraform
terraform init
terraform apply
cd ..
```
Skriv `yes` när Terraform frågar.

**2. PowerShell**
```powershell
powershell -ExecutionPolicy Bypass -File .\powershell\backup.ps1
```

**3. Python**
```powershell
python .\python\verifiera.py
```

Det ska stå `Alla filer finns i backupen!`

## Testa att det fungerar

- Ta bort en fil i `backup` och kör Python igen. Då står det `SAKNAS:` vid den filen.
- Kör PowerShell innan Terraform. Då kommer ett felmeddelande.
- Ändra `default = 3` i `variables.tf` och kör `terraform apply` igen. Då skapas fler filer.
- `terraform destroy` tar bort filerna som Terraform skapade.

## Felhantering

- PowerShell använder `try/catch` när filerna kopieras. `-ErrorAction Stop` behövs för att `catch` ska fånga felet.
- Båda skripten kollar med `if` att mapparna finns innan de gör något.

## Begränsningar

- Backupen ligger på samma dator. I verkligheten borde den ligga på en annan disk eller i molnet.
- Python kollar bara att filerna finns, inte att innehållet är samma.
- Man kör de tre stegen själv, ett i taget.

## AI och källor

Jag har använt AI (Claude) som hjälp för att skriva koden och README. Jag har testat allt och gått igenom
koden så att jag förstår den. Idén kommer från lärarens exempel och kursmaterialet.

## Reflektion

<!-- Skriv med dina egna ord: vad lärde du dig, vad var svårt, vad skulle du göra bättre? -->
