
resource "aws_instance" "terraform" {
  ami                         = "ami-09c813fb71547fc4f"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = "terraform_instance"
  }

provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

connection {
    type     = "ssh"
    user     = "root"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
       "sudo dnf install nginx -y",
       "sudo systemctl start  nginx -y",
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
 
       "sudo systemctl stop  nginx ",
    ]
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
    protocol         = "tcp" # Corrected to "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Consider restricting to specific IP range for better security
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

 

#