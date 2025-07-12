resource "tls_private_key" "KeyPairGeneration" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "PrivateKey" {
  content  = tls_private_key.KeyPairGeneration.private_key_pem
  filename = "${path.module}/KeyPair.pem"
}

# Oregon VM Key
resource "aws_key_pair" "OregonKey" {
  provider = aws.Oregon
  key_name   = "${var.name-prefix}-Oregon-Key"
  public_key = tls_private_key.KeyPairGeneration.public_key_openssh
}

# North_Virginia VM's Key
# Oregon VM Key
resource "aws_key_pair" "North_VirginiaKey" {
  provider = aws.North_Virginia
  key_name   = "${var.name-prefix}-North_Virginia-Key"
  public_key = tls_private_key.KeyPairGeneration.public_key_openssh
}