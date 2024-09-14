locals {
    domain_name  = "joinsankardevops.online"
    zone_id = "Z0546980MG8YEKTBB5HW"
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
    # count.index will not work in locals
}