variable "instance_names" {
  type    = list(string)
  default = ["mysql", "frontend", "backend"]
}


variable "domain_name" {
  default = "joinsankardevops.online"

}


variable "zone_id" {
  default = "Z0546980MG8YEKTBB5HW"
}