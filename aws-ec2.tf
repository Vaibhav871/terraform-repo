
resource "aws_key_pair" "terra_key-pair" {
    key_name = "terraforn-keypair"
    public_key = file("/ec2-instance.pub")
}

resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_terra_sg" {
  name = "terra-sgec2"
  vpc_id = aws_default_vpc.default.id
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terra-instance" {
  ami = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terra_key-pair.key_name
  security_groups = [aws_security_group.my_terra_sg.name]
  tags = {
        name="terraform_instance"
    }
}