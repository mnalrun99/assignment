variable "vpc_cidr" {
    description = "CIDR block for VPC"
    default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
    description = "CIDR for public subnet"
    default = "10.0.1.0/24"
  
}

variable "private_subnet_cidr" {
    description = "CIDR for private subnet"
    default = "10.0.2.0/24"
  
}
