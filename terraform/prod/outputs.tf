output "external_ip_address_app" {
  value = module.app[*]
}

output "external_ip_address_db" {
  value = module.db[*]
}
