variable "env" { default = "dev" }
variable "region" { default = "us-east-1" }
variable "vpc_cidr" {}
variable "public_subnets" { type = list(string) }
variable "azs" { type = list(string) }
