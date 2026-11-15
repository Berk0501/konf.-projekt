# verifiera.py
# Det här skriptet kollar att alla filer finns i backup-mappen.
# Jag kör skriptet från projektmappen (backup-projekt).

import os

kalla = "viktiga_filer"
backup = "backup"

# kolla att backup-mappen finns
if not os.path.exists(backup):
    print("FEL: Mappen backup finns inte. Kör backup.ps1 först.")
    exit()

allt_ok = True

# gå igenom filerna en i taget
for fil in os.listdir(kalla):
    if os.path.exists(backup + "/" + fil):
        print("OK: " + fil)
    else:
        print("SAKNAS: " + fil)
        allt_ok = False

if allt_ok:
    print("Alla filer finns i backupen!")
else:
    print("Några filer saknas i backupen!")
