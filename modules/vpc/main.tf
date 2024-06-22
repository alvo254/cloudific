resource "aws_vpc" "cloudific" {
  instance_tenancy = "default"
  cidr_block = var.cidr_block
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project}-${var.env}-vpc"
    }

}

data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.cloudific.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.cloudific.ipv6_cidr_block, 8, 1)
  assign_ipv6_address_on_creation = true

   tags = {
    Name = "${var.project}-${var.env}-pub-sub-IPV6-expriment"
  }
}

//For loadbalancing only since you need 2 subnets for the alb
resource "aws_subnet" "public_subnet2" {
  vpc_id = aws_vpc.cloudific.id
  cidr_block = var.public_subnet2
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.cloudific.ipv6_cidr_block, 8, 3)
  assign_ipv6_address_on_creation = true

   tags = {
    Name = "${var.project}-${var.env}-pub-sub-IPV6-expriment"
  }
}


resource "aws_subnet" "private_subent1" {
  vpc_id = aws_vpc.cloudific.id
  cidr_block              = var.private_subnet
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available_zones.names[0] 


  ipv6_cidr_block                 = cidrsubnet(aws_vpc.cloudific.ipv6_cidr_block, 8, 2)
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "${var.project}-${var.env}-prvt-sub-IPV6-expriment"
  }
}


resource "aws_internet_gateway" "pawsome" {
    vpc_id = aws_vpc.cloudific.id

  tags = {
    Name = "${var.project}-${var.env}-igw"
  }
}


resource "aws_route_table" "pawsome" {
  vpc_id = aws_vpc.cloudific.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pawsome.id
  }
   route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.pawsome.id
  }

  tags = {
    Name = "${var.project}-${var.env}-public-rt"
  }
}

resource "aws_route_table_association" "pawsome" {
  route_table_id = aws_route_table.pawsome.id
  subnet_id = aws_subnet.public_subnet1.id
}

resource "aws_route_table_association" "pawsome2" {
  route_table_id = aws_route_table.pawsome.id
  subnet_id = aws_subnet.public_subnet2.id
}