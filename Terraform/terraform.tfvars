
region       = "us-east-1"

aws_vpc      = "192.168.0.0/16"

prv_sub1     = "192.168.0.0/19"
prv_sub2     = "192.168.32.0/19"


pub_sub1     = "192.168.64.0/19"
pub_sub2     = "192.168.96.0/19"


aws_azla     = "us-east-1a"
aws_azlb     = "us-east-1b"

ec2_type     = "t2.micro"
ec2_ami      = "ami-080e1f13689e07408"

eks_node_ami_id = "ami-04e5276ebb8451442"

egress_route2 = "0.0.0.0/0"
egress_route = ["0.0.0.0/0"]



# vpc_id = aws_vpc.vpctask2.id

key_name    = "ec2-key-pair"
pub_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIuo6QWk49ShuRwBNqtQQEo0RDjt64BY5WIo3iBYV71FYDs/ZACBUtpF2kTGqxsBtsz/ZZCe9yn4em+gg3xEHM0bwUUbpCz1mlExYlxkJBiARbxdwhmqoOHI61hwLFEMPFzTUdp1DLBkBbVm6mz2UtECcPCnTt+vuDPL3fmWZoQGpcJpkFmHpkQmUsR67c343QmFoPYZ3MOTT/vqFUSYSsad24NAHXmVgX3SNwj6dfeSUZFhbf6L3wBwvtXD722OM6oaIMhG6oN5PLi8fV0C+XtzvxwZ9mMN+cbuJRc33YtuuH9Nhh2Wqr9iQqz8LzqFxsaRUhWy466FwaH+sob9SH ismail@ismail"
