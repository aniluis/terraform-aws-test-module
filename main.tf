data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}


# create an s3 bucket
resource "aws_s3_bucket" "bucket" {
  count               = length(var.bucket_name)
  bucket              = element(var.bucket_name,count.index)
  force_destroy       = true
  object_lock_enabled = var.object_lock_enabled
  tags = merge(
    {
      "CreatedBy" = "Terraform"
    },
    var.tags,
  )
}
