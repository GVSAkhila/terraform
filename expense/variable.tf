
variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_id" {
    default = "Z05207513DMEHXL2N1MM2"
}

variable "domain_name" {
    default = "joinsankardevops.online"
}
