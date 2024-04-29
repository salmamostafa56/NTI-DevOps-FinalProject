
#Lanuch configuration
resource "aws_launch_configuration" "eks_nodes_lc" {
  name                        = "eks-nodes-lc"
  image_id                    = var.eks_node_ami_id
  instance_type               = "t2.medium"
  security_groups             = [aws_security_group.eks_nodes_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.eks_nodes_profile.name
  key_name                    = var.key_name
  user_data                   = base64encode(templatefile("${path.module}/scripts/bootstrap.sh", { eks_cluster_endpoint = aws_eks_cluster.demo.endpoint }))
  lifecycle {
    create_before_destroy = true
  }
}


#Auto scaling Group
resource "aws_autoscaling_group" "eks_nodes_asg" {
  launch_configuration       = aws_launch_configuration.eks_nodes_lc.id
  vpc_zone_identifier        = concat(aws_subnet.private-us-east-1a.*.id, aws_subnet.private-us-east-1b.*.id)
  min_size                   = 2
  max_size                   = 5
  desired_capacity           = 2
  health_check_type          = "EC2"
  health_check_grace_period  = 300
  termination_policies       = ["OldestInstance"]
  tag {
    key                       = "Name"
    value                     = "eks-nodes"
    propagate_at_launch       = true
  }
}



