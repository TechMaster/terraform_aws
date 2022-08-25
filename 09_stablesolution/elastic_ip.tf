resource "aws_eip" "elastic_ip" {
  instance = aws_instance.web.id
  vpc      = true
}