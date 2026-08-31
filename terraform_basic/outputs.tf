# output "instance_id" {
#   # value = aws_instance.myinstance.id
#   value = aws_instance.myinstance[*].id
# }

# output "instance_public_ip" {
#   # value = aws_instance.myinstance.public_ip
#   value = aws_instance.myinstance[*].public_ip
# }

# output "instance_private_ip" {
#   # value = aws_instance.myinstance.private_ip
#   value = aws_instance.myinstance[*].private_ip
# }

output "instance_ids" {
  value = {
    for key, instance in aws_instance.myinstance :
    key => instance.id
  }
}

output "instance_public_ips" {
  value = {
    for key, instance in aws_instance.myinstance :
    key => instance.public_ip
  }
}

output "instance_private_ips" {
  value = {
    for key, instance in aws_instance.myinstance :
    key => instance.private_ip
  }
}
