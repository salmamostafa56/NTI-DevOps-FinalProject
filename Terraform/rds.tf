resource "aws_db_instance" "eks_db_instance" {
  identifier                  = "eks-db"
  allocated_storage           = 20
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t2.micro"
  name                        = "eks_db"
  username                    = var.db_username
  password                    = var.db_password
  parameter_group_name        = "default.mysql5.7"
  publicly_accessible         = false
  vpc_security_group_ids      = [aws_security_group.eks_db_sg.id]
  subnet_group_name           = aws_db_subnet_group.eks_db_subnet.name

  lifecycle {
    ignore_changes = [
      allocated_storage,
      engine,
      engine_version,
      instance_class,
      name,
      username,
      password,
      parameter_group_name,
      vpc_security_group_ids,
      subnet_group_name,
    ]
  }
}

