provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami = "ami-0a932bbdde8ed7b5f"
  instance_type = "t2.micro"

  tags = {
    "Name" = "terraform-example"
  }
}