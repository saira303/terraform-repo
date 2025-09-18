## preferances##
# 1. command line
# 2. terraform.tfvars
# 3. environment variables, TF_VAR_your_variable_name
# 4. default
# 5. prompt


variable "ami_id" {
    default= "ami-0b09ffb6d8b58ca91"
    type= string
    description= "this ami is amazon linux provided by AWS"
}


variable "instance_type" {
    default= "t3.micro"
    type= string
    description= "instance type that meets your computing, memory, networking, or storage needs."
}



variable "tags" {
    type= map
    default= {
        Name= "backend"
        project= "Cisco_infra"
        component= "backend"
        Environment= "test"
        Terraform= "Yes"
    }

}


variable "sg_name"{
    type= string
    default= "allow_ssh"
}

variable "sg_discription"{
    type= string
    default= "allowing port 22 to access ssh"
}


variable "to_port" {
    default= 22
}


variable "from_port" {
    default= 22
}

variable "ingress_cidr" {
    type= list(string)
    default= ["0.0.0.0/0"]
}



variable "protocol" {
    default = "tcp"
}