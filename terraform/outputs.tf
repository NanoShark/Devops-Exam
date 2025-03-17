output "instance_ip" {
  value       = aws_instance.builder.public_ip
  description = "The public IP of the EC2 instance"
}

output "ssh_key_location" {
  value       = local_file.private_key.filename
  description = "The location of the SSH private key file"
}

output "security_group_id" {
  value       = aws_security_group.builder_sg.id
  description = "The ID of the security group"
}

output "ssh_command" {
  value       = "ssh -i ${local_file.private_key.filename} ubuntu@${aws_instance.builder.public_ip}"
  description = "SSH command to connect to the instance"
}