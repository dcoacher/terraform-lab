resource "aws_vpc_peering_connection" "Peering-Request" {
  provider = aws.Oregon
  vpc_id        = aws_vpc.Oregon-VPC.id
  peer_vpc_id   = aws_vpc.North_Virginia-VPC.id
  peer_region   = "us-east-1"
  auto_accept   = false

  tags = {
    Name = "VPC Peering between Oregon and North Virginia"
  }
}

resource "aws_vpc_peering_connection_accepter" "Peering-Accepting" {
  provider                   = aws.North_Virginia
  vpc_peering_connection_id  = aws_vpc_peering_connection.Peering-Request.id
  auto_accept                = true

  tags = {
    Name = "VPC Peering between Oregon and North Virginia"
  }
}

resource "aws_route" "Route-From-Oregon-to-North_Virginia" {
  provider = aws.Oregon
  route_table_id         = aws_route_table.Oregon-RT.id
  destination_cidr_block = aws_vpc.North_Virginia-VPC.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.Peering-Request.id
}

resource "aws_route" "Route-From-North_Virginia-to-Oregon" {
  provider = aws.North_Virginia
  route_table_id         = aws_route_table.North_Virginia-RT.id
  destination_cidr_block = aws_vpc.Oregon-VPC.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.Peering-Request.id
}