variable "name-prefix" {
  description = "Prod Prefix"
  type = string
}

variable "vm-size" {
  description = "Dev VM Size"
  type = string
}

# variable "key_pair" {
#   description = "Key Pair"
#   type = string
# }

variable "ami-region-1" {
  description = "AMI For Region 1"
  type = string
}

variable "ami-region-2" {
  description = "AMI For Region 2"
  type = string
}

variable "vpc1-cidr" {
  description = "VPC1 Cidr"
  type = string
}

variable "vpc1-subnet-1" {
  description = "VPC1 Subnet 1"
  type = string
}

variable "vpc1-subnet-2" {
  description = "VPC1 Subnet 2"
  type = string
}

variable "vpc2-cidr" {
  description = "VPC2 Cidr"
  type = string
}

variable "vpc2-subnet-1" {
  description = "VPC2 Subnet 1"
  type = string
}

variable "vpc2-subnet-2" {
  description = "VPC2 Subnet 2"
  type = string
}

variable "aws_access_key_id" {
  description = "Access Key" 
  type = string
}

variable "aws_secret_access_key" {
  description = "Secret Key" 
  type = string
}

variable "aws_session_token" {
  description = "Session Token" 
  type = string
}
