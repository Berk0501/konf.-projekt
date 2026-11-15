# main.tf
# Här skriver jag vad Terraform ska skapa.
# Terraform skapar mappen viktiga_filer med några textfiler i.

terraform {
  required_providers {
    local = {
      source = "hashicorp/local" # providern local kan skapa filer på min dator
    }
  }
}

provider "local" {}

# här skapar jag filerna fil1.txt, fil2.txt och fil3.txt
resource "local_file" "filer" {
  count    = var.antal_filer # skapar lika många filer som antal_filer
  filename = "../viktiga_filer/fil${count.index + 1}.txt" # count.index börjar på 0 så jag tar +1
  content  = "Det här är en viktig fil"
}
