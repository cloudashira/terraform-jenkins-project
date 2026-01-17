provider "aws" {
  region = "ap-south-1"
}

# Use your custom VPC ID directly
data "aws_subnets" "default" {
  filter {
    name   = "jenkins"
    values = ["vpc-03101880556ae0a7a"]  # replace with your VPC ID
  }
}

resource "aws_instance" "demo" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnets.default.ids[0]

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }
}

