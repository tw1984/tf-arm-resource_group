output "id" {
  value = module.rg.id
}

output "readerId" {
  value = module.rg.*.readerId
}

output "readerName" {
  value = module.rg.*.readerName
}
