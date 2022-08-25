data "aws_s3_bucket_objects" "my_objects" {
  bucket = "awshardway.click"
}

data "aws_s3_bucket_object" "object_info" {
  count  = "${length(data.aws_s3_bucket_objects.my_objects.keys)}"
  key    = "${element(data.aws_s3_bucket_objects.my_objects.keys, count.index)}"
  bucket = "${data.aws_s3_bucket_objects.my_objects.bucket}"
}