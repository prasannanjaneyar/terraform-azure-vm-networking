output "vm_private_ips" {
  value = [for v in module.vms : v.private_ip]
}

output "vm_public_ips" {
  value = [for v in module.vms : v.public_ip]
}
