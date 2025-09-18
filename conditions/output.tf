output "public_ip" {
  value       = aws_instance.condition.public_ip
  sensitive   = false
  description = "This is the Public IP of instance created"
}