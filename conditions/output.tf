output "Public_ip" {
  value       = "aws_instance.terraform.public_ip"
  sensitive   = false
  description = "this the public of instance created"
  depends_on  = []
}
