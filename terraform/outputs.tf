# outputs.tf
# Det här visas när terraform apply är klar så jag ser vilka filer som skapades

output "skapade_filer" {
  value = local_file.filer[*].filename
}
