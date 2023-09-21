# ----------------------------------------
# プライベートバケット
# ----------------------------------------
resource "aws_s3_bucket" "private_bucket" {
  bucket = "my-private-terraform-bucket" # バケット名を具体的なものに変更
}

resource "aws_s3_bucket_versioning" "private_versioning" {
  bucket = aws_s3_bucket.private_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "private_encryption" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ----------------------------------------
# ブロックパブリックアクセス
# ----------------------------------------
resource "aws_s3_bucket_public_access_block" "private_access_block" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ----------------------------------------
# パブリックバケット
# ----------------------------------------
resource "aws_s3_bucket" "public_website_bucket" {
  bucket = "my-public-terraform-website-bucket" # バケット名を具体的なものに変更
  acl    = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "public_cors" {
  cors_rule {
    allowed_origins = ["https://example.com"]
    allowed_methods = ["GET"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }
}
