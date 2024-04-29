
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = var.pub_key
}

resource "aws_instance" "task_ec2" {
  ami           = var.ec2_ami  # Ubuntu 20.04 LTS AMI ID
  instance_type = var.ec2_type

  key_name = aws_key_pair.ec2_key_pair.key_name  # Use the created key pair for SSH authentication

  // Associate the instance with a security group
  vpc_security_group_ids = [aws_security_group.task_sg.id]
  user_data       = "${file("script.sh")}"
}

resource "aws_security_group" "task_sg" {
  name        = "ec2-security-group"
  description = "Security group for example instance"

  // Ingress rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.egress_route   # Allow SSH access from anywhere
  }

  // Ingress rule for ICMP (ping)
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.egress_route  # Allow ping from anywhere
  }
 // Ingress rule for HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.egress_route # Allow HTTP access from anywhere
  }
 // Ingress rule for Jenkins (port 8080)
    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.egress_route # Allow HTTP access from anywhere
  }
  // Egress rule allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_route
  }
}


resource "local_file" "public_ip_file" {
   filename= "inventory"
   content= aws_instance.task_ec2.public_ip 
}



