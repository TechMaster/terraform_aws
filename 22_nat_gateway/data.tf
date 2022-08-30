//danh sách AZ trong region
data "aws_availability_zones" "az_available" {
  state = "available"
}