provider "azure" {
  region = "ap-south-1"
}

# Get your custom VPC by ID
data "azure_vpc" "jenkins" {
  id = "vpc-03101880556ae0a7a"
}

# Get all subnets inside this VPC
data "azure_subnets" "jenkins" {
  filter {
    name   = "vpc-id"
    values = [data.azure_vpc.jenkins.id]
  }
}

# EC2 instance
resource "azure_instance" "demo" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  subnet_id     = "subnet-02bed3b0353321c9f"  # <- quotes added

  tags = {
    Name = "ashira"
  }
}

