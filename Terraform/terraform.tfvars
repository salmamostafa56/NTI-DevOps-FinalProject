
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
pub_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUo6i8peP7y3f/NcrGmkO8XG1ybTSBVjlIfbKUDSonz4yNTZSgNOr5jCxI0dsoI7kM0a7/q4TQuXJW39EPfgoGAfVi4QZAF7EGlLAjVghtKHFIi235XgW1RpagqSw0QbVZddx7A+t9m68w7YnD6IzfuBzzfL2OdJjBtEEKbZdKzxScWeofdilKjZmu/cJ90V9ovYyBUY+VMvq7pZr4eTX+gAVXPkWMvIueuMbTzG5nOvDif3UicBJo9AwQE5zNyqtWAe2L2wCIkuy0ureEwwZpzMqya2F64wWYit5DyKgUTLYEvhurH6bH0yy+8arZ3RbzWAIqh6ZHvBbpmZyplCVjDq/qLAuXaTdu4vfVcGYSEkXJz0vxNRJo06+XDbMZZ2B4a+N2W78egJ7j/OofmOsMDWUfaSwatnz2IMkpAvqWFr6HwFBjNTs/DEZhWNO0uju6NF8/VtyCnCLt10Rl2Tr42SmtAf0Yh6Ykd65wE5zbLvqQurKczPADyKHbVbcRNjM= salma@mx"
