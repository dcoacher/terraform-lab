# Oregon VM1
resource "aws_instance" "Oregon-VM1" {
  provider = aws.Oregon
  ami           = var.ami-region-1
  instance_type = var.vm-size
  key_name = aws_key_pair.OregonKey.key_name
  vpc_security_group_ids = [aws_security_group.Allow-RDP-HTTP.id]
  subnet_id = aws_subnet.Oregon-Subnet-1.id
  
  tags = {
    Name = "${var.name-prefix}-VM1"
  }
}

# North_Virginia VM1&VM2
resource "aws_instance" "North_Virginia-VMs" {
  provider = aws.North_Virginia
  ami           = var.ami-region-2
  instance_type = var.vm-size
  key_name = aws_key_pair.North_VirginiaKey.key_name
  count = 2
  vpc_security_group_ids = [aws_security_group.Allow-RDP-HTTP-from-Oregon.id]
  subnet_id = aws_subnet.North_Virginia-Subnet-1.id
  
  tags = {
    Name = "${var.name-prefix}-VM-${count.index + 50}"
  }
}