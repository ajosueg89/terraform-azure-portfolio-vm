variable "name" {
  type = string 
}
variable "location" {
  type = string 
}
variable "resource_group_name" {
  type = string 
}
variable "tags" {
  type = map(string)
  default = {} 
}
variable "allowed_ssh_cidr" {
  description = "CIDR allowed to access SSH (22)"
  type        = string
  default     = "0.0.0.0/0"
}
