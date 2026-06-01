# outputs.tf
output "vpc_id" { value = aws_vpc.jenkins_vpc.id }
output "public_subnet_id" { value = aws_subnet.public_subnet_a.id }