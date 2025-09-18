variable "instance_name" {
    default = ["mysql", "backend"]
    type = list(string)
}

variable "common_tags" {
    default = { 
        Project = "cisco"  
        Env = "Dev" 
        terrafro = "yes"
        }
    type = map
}