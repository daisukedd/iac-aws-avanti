resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id 
  instance_type = "t3.micro"  

  key_name = aws_key_pair.ec2_key_pair.key_name

  vpc_security_group_ids = [
    aws_security_group.http_sg.id,
    aws_security_group.ssh_sg.id,
    aws_security_group.egress_all_sg.id
  ]

  root_block_device {
    volume_size = 8   
    volume_type = "gp2"
  }

  tags = {
    Name = "WebServer-DVP"
  }
}