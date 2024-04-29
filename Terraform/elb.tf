// Define the S3 bucket for storing ELB access logs
resource "aws_s3_bucket" "elb_logs_bucket" {
  bucket = "elb-access-logs-bucket"
  acl    = "private"

  tags = {
    Name        = "ELB Access Logs Bucket"
    Environment = "Production"
  }
}

// Define IAM policy for granting permissions to write ELB logs to the S3 bucket
data "aws_iam_policy_document" "elb_logs_policy" {
  statement {
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.elb_logs_bucket.bucket}/*"]

    principals {
      type        = "Service"
      identifiers = ["elasticloadbalancing.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

//Attach IAM policy to the IAM role used by the ELB
resource "aws_iam_role_policy_attachment" "elb_logs_policy_attachment" {
  role       = aws_iam_role.demo.name # Assuming this role is used by the ELB
  policy_arn = aws_iam_policy.elb_logs_policy.arn
}

// Define the ELB with access logging enabled
resource "aws_elb" "eks_elb" {
  name                        = "eks-elb"
  availability_zones          = ["us-east-1a", "us-east-1b"]
  subnets                     = concat(aws_subnet.public-us-east-1a.*.id, aws_subnet.public-us-east-1b.*.id)
  security_groups             = [aws_security_group.eks_elb_sg.id]
  listener {
    instance_port             = 80
    instance_protocol         = "HTTP"
    lb_port                   = 80
    lb_protocol               = "HTTP"
  }

  // Access logging configuration
  access_logs {
    bucket        = aws_s3_bucket.elb_logs_bucket.bucket
    bucket_prefix = "elb-access-logs/"
    enabled       = true
  }

  tags = {
    Name          = "eks-elb"
  }
}


//Sequrity group


resource "aws_security_group" "eks_elb_sg" {
  name        = "eks-elb-sg"
  description = "Security group for the EKS Elastic Load Balancer"

  vpc_id = aws_vpc.k8svpc.id

 //Define ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow inbound traffic from any IPv4 address
  }

  // Define egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // Allow all protocols
    cidr_blocks = ["0.0.0.0/0"] // Allow outbound traffic to any IPv4 address
  }

  tags = {
    Name = "eks-elb-sg"
  }
}



