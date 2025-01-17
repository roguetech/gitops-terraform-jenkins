# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-state-hfg65"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "eu-west-1"
}

# Create EC2 instance
resource "aws_instance" "example" {
  ami                    = "${var.ami}"
  #count                  = "${var.count}"
  //key_name               = "${var.key_name}"
  //vpc_security_group_ids = ["${aws_security_group.example1234.id}"]
  source_dest_check      = false
  instance_type          = "${var.instance_type}"
  subnet_id = "subnet-6e619d09"

  #tags 
  #  Name = "terraform-default"
}

# Create Security Group for EC2
resource "aws_security_group" "example2234" {
  name = "terraform-default-sg1"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
