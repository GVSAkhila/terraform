variable instances {
  type        = map
  default     = {
    mysql = "t3.small"
    frontend = "t3.micro"
    backend  = "t3.micro"
  }
}


variable "domain_name" {
  default = "joinsankardevops.online"

}


variable "zone_id" {
  default = "Z0546980MG8YEKTBB5HW"
}