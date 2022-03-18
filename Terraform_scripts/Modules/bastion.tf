resource "aws_key_pair" "testkey" {
  key_name   = "feb9.pem"
  public_key = file("./feb9.pub")
}
resource "aws_instance" "Bastion" {
  
  subnet_id = aws_subnet.public-subnet.id
  ami = var.bastion-ami
  instance_type = var.bastion-type
  key_name = "feb9.pem"
  associate_public_ip_address = true

  tags = {
      Name = "Boston"
  }
}
