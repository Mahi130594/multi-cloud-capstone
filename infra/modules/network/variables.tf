variable "env" {}
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnets" { type = list(string) }
variable "azs" { type = list(string) }
