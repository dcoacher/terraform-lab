# SG for Oregon
resource "aws_security_group" "Allow-RDP-HTTP" {
  provider = aws.Oregon
  name        = "Allow-RDP-HTTP"
  description = "Allow-RDP-HTTP"
  vpc_id      = aws_vpc.Oregon-VPC.id

  tags = {
    Name = "Allow-RDP+HTTP"
  }
}

# Inbound Rule for Oregon
resource "aws_vpc_security_group_ingress_rule" "Allow-Inbound-RDP" {
  provider = aws.Oregon
  security_group_id = aws_security_group.Allow-RDP-HTTP.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3389
  ip_protocol       = "tcp"
  to_port           = 3389
}

# Inbound Rule for Oregon
resource "aws_vpc_security_group_ingress_rule" "Allow-Inbound-HTTP" {
  provider = aws.Oregon
  security_group_id = aws_security_group.Allow-RDP-HTTP.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Outbound Rule for Oregon
resource "aws_vpc_security_group_egress_rule" "Allow-Outbound-Any" {
  provider = aws.Oregon
  security_group_id = aws_security_group.Allow-RDP-HTTP.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# SG for North_Virginia
resource "aws_security_group" "Allow-RDP-HTTP-from-Oregon" {
  provider = aws.North_Virginia
  name        = "Allow-RDP-HTTP-from-Oregon"
  description = "Allow-RDP-HTTP-from-Oregon"
  vpc_id      = aws_vpc.North_Virginia-VPC.id

  tags = {
    Name = "Allow-RDP-HTTP-from-Oregon"
  }
}

# Inbound Rule for North_Virginia
resource "aws_vpc_security_group_ingress_rule" "Allow-Inbound-RDP-from-Oregon" {
  provider = aws.North_Virginia
  security_group_id = aws_security_group.Allow-RDP-HTTP-from-Oregon.id
  cidr_ipv4         = var.vpc1-cidr
  from_port         = 3389
  ip_protocol       = "tcp"
  to_port           = 3389
}

# Inbound Rule for North_Virginia
resource "aws_vpc_security_group_ingress_rule" "Allow-Inbound-HTTP-from-Oregon" {
  provider = aws.North_Virginia
  security_group_id = aws_security_group.Allow-RDP-HTTP-from-Oregon.id
  cidr_ipv4         = var.vpc1-cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Outbound Rule for North_Virginia
resource "aws_vpc_security_group_egress_rule" "Allow-Outbound-from-Oregon" {
  provider = aws.North_Virginia
  security_group_id = aws_security_group.Allow-RDP-HTTP-from-Oregon.id
  cidr_ipv4         = var.vpc1-cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}