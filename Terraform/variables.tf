variable "region" {
  type        = string
  description = "AWS Region"
}


variable "aws_vpc" {
  #default = "10.0.0.0/16"
  type        = string
  description = "CIDR of vpcTask2"
}

variable "prv_sub1" {
  #default = "10.0.1.0/24"
  type        = string
  description = "CIDR of [public] subnet"
}

variable "prv_sub2" {
  #default = "10.0.2.0/24"
  type        = string
  description = "CIDR of [private] subnet"
}


variable "pub_sub1" {
  #default = "10.0.1.0/24"
  type        = string
  description = "CIDR of [public] subnet"
}

variable "pub_sub2" {
  #default = "10.0.2.0/24"
  type        = string
  description = "CIDR of [public] subnet"
}


variable "ec2_type" {
  type        = string
  description = "Type of ec2"
}

variable "ec2_ami" {
  type        = string
  description = "Ami of ec2"
}
variable "eks_node_ami_id" {
  type        = string
  description = "Ami of ec2"
}

//Egress Routes

variable "egress_route" {
  type        = list
  description = "egress_route traffic"
}
variable "egress_route2" {
  type        = string
  description = "egress_route traffic"
}


# Availability Zone Vars
variable "aws_azla" {
  type        = string
  description = "Availability Zone"
}

variable "aws_azlb" {
  type        = string
  description = "Availability Zone"
}


variable "key_name" {
  type        = string
  description = "key_name for key pair on ec2 "
}

variable "pub_key" {
  type        = string
  description = "key pair on ec2"
}
