
# 1. command line
# 2. terraform.tfvars
# 3. environment variables, TF_VAR_your_variable_name
# 4. default
# 5. prompt


variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
}


variable "instance_type" {
  type        = string
  default     = "t3.micro"
  
}

variable "sg_name"{
 type = string
 default ="allow_ssh"
}



variable "tags" {
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}


variable "from_port"{
    type = number
    default =22
}


variable "to_port"{
    type = number
    default = 22
}


variable "protocal"{
     
    default ="tcp"
}


variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}