provider "aws" {
  region = "ap-south-1"
}

# Get your custom VPC by ID
data "aws_vpc" "jenkins" {
  id = "vpc-03101880556ae0a7a"
}

# Get all subnets inside this VPC
data "aws_subnets" "jenkins" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.jenkins.id]
  }
}

# EC2 instance
resource "aws_instance" "demo" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = "subnet-02bed3b0353321c9f"  # <- quotes added

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }
}

