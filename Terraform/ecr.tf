# Create an ECR repository

resource "aws_ecr_repository" "my_ecr_repository" {
  name = "my-ecr-repository"
  image_tag_mutability = "MUTABLE"
  
}

# Output the ECR repository URL

resource "local_file" "ecr_url" {
   filename= "ecr"
   content= aws_ecr_repository.my_ecr_repository.repository_url
}