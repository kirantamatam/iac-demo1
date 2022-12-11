resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
    purpose = "jenkins-demo"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  count = 3
  cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)

  tags = {
    Name = "public${count.index}"
  }
}
