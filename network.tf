# Oregon VPC1
resource "aws_vpc" "Oregon-VPC" {
  provider = aws.Oregon
  cidr_block       = var.vpc1-cidr

  tags = {
    Name = "${var.name-prefix}-VPC1"
  }
}

# North_Virginia VPC2
resource "aws_vpc" "North_Virginia-VPC" {
  provider = aws.North_Virginia
  cidr_block       = var.vpc2-cidr

  tags = {
    Name = "${var.name-prefix}-VPC2"
  }
}

# Oregon Subnet 1
resource "aws_subnet" "Oregon-Subnet-1" {
  provider = aws.Oregon
  vpc_id     = aws_vpc.Oregon-VPC.id
  cidr_block = var.vpc1-subnet-1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name-prefix}-Subnet1.1"
  }
}

# Oregon Subnet 2
resource "aws_subnet" "Oregon-Subnet-2" {
  provider = aws.Oregon
  vpc_id     = aws_vpc.Oregon-VPC.id
  cidr_block = var.vpc1-subnet-2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name-prefix}-Subnet1.2"
  }
}

# North_Virginia Subnet 1
resource "aws_subnet" "North_Virginia-Subnet-1" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc2-subnet-1

  tags = {
    Name = "${var.name-prefix}-Subnet2.1"
  }
}

# North_Virginia Subnet 2
resource "aws_subnet" "North_Virginia-Subnet-2" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc2-subnet-2

  tags = {
    Name = "${var.name-prefix}-Subnet2.2"
  }
}

# Oregon IGW
resource "aws_internet_gateway" "Oregon-IGW" {
  provider = aws.Oregon
  vpc_id = aws_vpc.Oregon-VPC.id

  tags = {
    Name = "${var.name-prefix}-IGW"
  }
}

# Oregon Route Table
resource "aws_route_table" "Oregon-RT" {
  provider = aws.Oregon
  vpc_id = aws_vpc.Oregon-VPC.id

  tags = {
    Name = "${var.name-prefix}-RT"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Oregon-IGW.id
  }
}

# Oregon Route Table Association for Subnet 1
resource "aws_route_table_association" "Oregon-RTA-Subnet-1" {
  provider = aws.Oregon
  subnet_id      = aws_subnet.Oregon-Subnet-1.id
  route_table_id = aws_route_table.Oregon-RT.id
} 

# Oregon Route Table Association for Subnet 2
resource "aws_route_table_association" "Oregon-RTA-Subnet-2" {
  provider = aws.Oregon
  subnet_id      = aws_subnet.Oregon-Subnet-2.id
  route_table_id = aws_route_table.Oregon-RT.id
} 
