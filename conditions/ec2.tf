resource "aws_instance" "condition" {
    ami                      = "ami-0b09ffb6d8b58ca91"
    instance_type            = var.env == "Prod" ? "t3.small" : "t3.micro"  #condition
    vpc_security_group_ids   = [ aws_security_group.allow_ssh.id ]
    tags= {
        Name= "backened"
    }

}

resource "aws_security_group" "allow_ssh"{
    name             = "allow_ssh"
    description      = "allowing port 22 to access ssh"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
    tags={
        Name= "backend"
    }

}


