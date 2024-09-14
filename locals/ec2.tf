resource "aws_instance" "terraform" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.joindevops.id
  instance_type          = var.instance_names[count.index] == "mysq" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = var.instance_names[count.index]
  }
}


resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "Allow SSH access on port 22"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allow all outbound traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"         # Corrected to "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Consider restricting to specific IP range for better security
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}