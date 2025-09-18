resource "aws_instance" "count"  {
    count = length(var.instance_name)
    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.sg_name.id]
    tags = merge (
        var.common_tags,
        {
            Name = var.instance_name[count.index]
        }
    )        
    }



resource "aws_security_group" "sg_name" {
    name = "allow_ssh"
    description = "allowing 22 port"


    # usually we allow everything in egress
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}
   
