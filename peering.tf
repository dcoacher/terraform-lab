# resource "aws_vpc_peering_connection" "Peering" {
#   provider = aws.Oregon
#   peer_vpc_id   = aws_vpc.North_Virginia-VPC.id
#   vpc_id        = aws_vpc.Oregon-VPC.id
#   auto_accept   = true

#   tags = {
#     Name = "VPC Peering between Oregon and North Virginia"
#   }
# }

# resource "aws_vpc_peering_connection_accepter" "PeeringAccepter" {
#   provider                  = aws.North_Virginia
#   vpc_peering_connection_id = aws_vpc_peering_connection.Peering.id
#   auto_accept               = true
  
#   tags = {
#     Name = "Accepter for VPC Peering Oregon <-> North Virginia"
#   }
# }