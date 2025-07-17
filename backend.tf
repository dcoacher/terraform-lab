#  # S3 Bucket for Tfstate file (also removed from tfstate via command "terraform state rm  aws_s3_bucket.Tfstate-Bucket")
#  resource "aws_s3_bucket" "Tfstate-Bucket" {
#    provider = aws.Oregon
#    bucket = "desmond-devops-technion-terraform-lab"
#    force_destroy = true
#    tags = {
#     Name = "Tfstate-Bucket"
#    }
#  }

# S3 Bucket for Tfstate file (Learning from already created and removed from Tfstate file resource, but existing in AWS environment)
data "aws_s3_bucket" "Tfstate-Bucket" {
  provider = aws.Oregon
  bucket = "desmond-devops-technion-terraform-lab"
}

# S3 Bucket Versioning for Tfstate file
 resource "aws_s3_bucket_versioning" "Tfstate-Bucket-Versioning" {
   provider = aws.Oregon
   bucket = data.aws_s3_bucket.Tfstate-Bucket.id

   versioning_configuration {
     status = "Enabled"
   }
 }

 # DynamoDB database creation for lock file
 resource "aws_dynamodb_table" "Database-Lock-File" {
   provider = aws.Oregon
   name = "database-lock-file"
   billing_mode = "PAY_PER_REQUEST"
   hash_key = "LockID"
   attribute {
     name = "LockID"
     type = "S"
   }
   tags = {
     Name = "Database-Lock-File"
   }
 }

# Backend Creation and Setting lock file to work with AWS S3 Cloud storage instead of local (run the command "terraform init -migrate-state" in order to migrate)
# Before running the command run cmd commands:
#1. set AWS_ACCESS_KEY_ID=<key>
#2. set AWS_SECRET_ACCESS_KEY=<key>
#3. set AWS_SESSION_TOKEN=<key>

terraform {
  backend "s3" {
    bucket = "desmond-devops-technion-terraform-lab"
    key = "global/s3/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "database-lock-file"
  }
}