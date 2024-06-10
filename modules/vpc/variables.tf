variable "cidr_block" {
  default = "172.16.0.0/20"
}

variable "project" {
  default = "cloudific"
}

variable "env" {
  default = "prod"
}

variable "public_subnet" {
  default = "172.16.0.0/21"
}

variable "private_subnet" {
  default = "172.16.8.0/21"
}
