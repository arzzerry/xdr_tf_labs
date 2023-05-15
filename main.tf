resource "aws_instance" "example" {
  ami           = "ami-0578f2b35d0328762"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}