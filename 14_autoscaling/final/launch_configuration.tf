resource "aws_launch_configuration" "terramino" {
  name_prefix     = "learn-terraform-aws-asg-"
  image_id        = data.aws_ami.amazon-linux.id
  instance_type   = "t2.micro"
  user_data       = file("script.sh")
  security_groups = [aws_security_group.terramino_instance.id]

  lifecycle {
    create_before_destroy = true
  }
}

/*
A launch configuration is a template that an EC2 Auto Scaling group uses to launch EC2 instances.
When you create a launch configuration, you specify information for the instances such as 
the ID of the Amazon Machine Image (AMI), the instance type, a key pair, one or 
more security groups, and a block device mapping.
*/