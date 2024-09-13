variable "instance_names" {
  type        = list(string)
  default     = ["mysql","frontend","backend"]
  description = "we are given names of created instances"
}
