# This is the ASG launch configuraiton block
resource "aws_launch_configuration" "example" {
  image_id        = "ami-024e6efaf93d85776"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]
    key_name      = "xdr_lab"

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.xhtml
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

  # Required when using a launch configuration with an auto
  # scaling group.
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_vpc" "default" {
  default = true
}
