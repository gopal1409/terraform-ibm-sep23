output "web_lb_public_ip_address" {
  description = "Web Loadbalancer public ip"
  value = azurerm_public_ip.web_linux_publicip.ip_address
}
