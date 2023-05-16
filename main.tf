resource "aws_instance" "example" {
  ami                    = "ami-0578f2b35d0328762"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  user_data                   = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.xhtml
                nohup busybox httpd -f -p 8080 &
                EOF
  user_data_replace_on_change = true
  tags = {
    Name = "terraform-example"
  }
}
