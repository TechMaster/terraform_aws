output "s3_object" {
 value = [for o in data.aws_s3_bucket_object.object_info : o.id]
}