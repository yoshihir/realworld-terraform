resource "aws_s3_bucket" "realworld" {
  bucket = "realworld-terraform-tfstate"
  acl = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "realworld-client" {
  acl = "private"
  arn = "arn:aws:s3:::realworld-client"
  bucket = "realworld-client"
  force_destroy = false
  hosted_zone_id = "Z2M4EHUR26P7ZW"
  region = "ap-northeast-1"
  request_payer = "BucketOwner"
  tags = {}

  versioning {
    enabled = false
    mfa_delete = false
  }
}

resource "aws_s3_bucket_policy" "realworld-client" {
  bucket = "realworld-client"
  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Sid": "1",
      "Effect": "Allow",
      "Principal": {"AWS":"arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity EFON57LA4BJXZ"},
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::realworld-client/*"
    }
  ]
}
POLICY
}
