#Create AWS VPC
resource "aws_vpc" "itsolutionrhevvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "itsolutionrhevvpc"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "itsolutionrhevvpc-public-1" {
  vpc_id                  = aws_vpc.itsolutionrhevvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "itsolutionrhevvpc-public-1"
  }
}

resource "aws_subnet" "itsolutionrhevvpc-public-2" {
  vpc_id                  = aws_vpc.itsolutionrhevvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "itsolutionrhevvpc-public-2"
  }
}

resource "aws_subnet" "itsolutionrhevvpc-public-3" {
  vpc_id                  = aws_vpc.itsolutionrhevvpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1c"

  tags = {
    Name = "itsolutionrhevvpc-public-3"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "itsolutionrhevvpc-private-1" {
  vpc_id                  = aws_vpc.itsolutionrhevvpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "itsolutionrhevvpc-private-1"
  }
}

resource "aws_subnet" "itsolutionrhevvpc-private-2" {
  vpc_id                  = aws_vpc.itsolutionrhevvpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "itsolutionrhevvpc-private-2"
  }
}

resource "aws_subnet" "itsolutionrhevvpc-private-3" {
  vpc_id                  = aws_vpc.itsolutionrhevvpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-1c"

  tags = {
    Name = "itsolutionrhevvpc-private-3"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "itsolutionrhev-gw" {
  vpc_id = aws_vpc.itsolutionrhevvpc.id

  tags = {
    Name = "itsolutionrhev-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "itsolutionrhev-public" {
  vpc_id = aws_vpc.itsolutionrhevvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.itsolutionrhev-gw.id
  }

  tags = {
    Name = "itsolutionrhev-public-1"
  }
}

resource "aws_route_table_association" "itsolutionrhev-public-1-a" {
  subnet_id      = aws_subnet.itsolutionrhevvpc-public-1.id
  route_table_id = aws_route_table.itsolutionrhev-public.id
}

resource "aws_route_table_association" "itsolutionrhev-public-2-a" {
  subnet_id      = aws_subnet.itsolutionrhevvpc-public-2.id
  route_table_id = aws_route_table.itsolutionrhev-public.id
}

resource "aws_route_table_association" "itsolutionrhev-public-3-a" {
  subnet_id      = aws_subnet.itsolutionrhevvpc-public-3.id
  route_table_id = aws_route_table.itsolutionrhev-public.id
}
