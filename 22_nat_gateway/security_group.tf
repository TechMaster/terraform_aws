//Security group cho public bastion host
resource "aws_security_group" "ssh_ping" {
  name   = "ssh_ping"
  vpc_id = module.vpc.vpc_id
  ingress { //ICMP Ping
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { //SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { //Allow all outbound ports
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//Security group cho private EC2 instance nằm trong private subnet
resource "aws_security_group" "private_ssh_ping" {
  name   = "private_ssh_ping"
  vpc_id =  module.vpc.vpc_id

  ingress { //ICMP Ping
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    security_groups = [aws_security_group.ssh_ping.id]
  }

  ingress { //SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.ssh_ping.id]
  }

  //Cần bổ xung thêm để nối vào NAT Gateway
  egress { //Allow all outbound ports
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

