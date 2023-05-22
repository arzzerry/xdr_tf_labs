resource "aws_security_group" "instance" {
  name        = "terraform-example-instance"
  description = "Allow http inbound traffic"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["73.135.212.247/32"]
  }
  tags = {
    Name = "allow_http"
  }
}