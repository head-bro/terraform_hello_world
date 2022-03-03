provider "aws" {
  region = "eu-central-1"
}

# terraform {
#   backend "s3" {
#     bucket = "mm-terraform-lesson3"
#     key = "global/s3/terraform.tfstate"
#     region = "eu-central-1"
#     dynamodb_table = "terraform-locks"
#     encrypt = true
#   }
# }

resource "aws_s3_bucket" "terraform_state" {
  bucket = "mm-terraform-lesson3"

  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
