resource "aws_s3_bucket" "s3_vaibhav_bucket" {
  bucket = "vaibhav-terra-bucket"
  tags = {
    name= "first_aws_bucket"
  }
}