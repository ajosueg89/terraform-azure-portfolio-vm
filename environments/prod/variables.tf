variable "env" {
  type = string
}
variable "location" {
  type    = string
  default = "eastus"
}
variable "address_space" {
  type    = string
  default = "10.10.0.0/16"
}
variable "subnet_prefix" {
  type    = string
  default = "10.10.1.0/24"
}
variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}
variable "admin_username" {
  type    = string
  default = "azureuser"
}
variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
