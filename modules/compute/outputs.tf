# outputs.tf
output "master_public_ip" { value = aws_instance.jenkins_master.public_ip }
output "slave_public_ip" { value = aws_instance.jenkins_slave.public_ip }