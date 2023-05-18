resource "aws_security_group" "instance_sg" {
  name        = "terraform-example-instance"
  description = "Allow http inbound traffic"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}