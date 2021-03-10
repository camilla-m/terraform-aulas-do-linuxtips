output "public_ip" {
  value = aws_instance.web[*].public_ip
}

output "environment" {
  value = var.environment
}