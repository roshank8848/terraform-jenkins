# Security Group for Jenkins Infrastructure
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-security-group"
  description = "Allow Web, SSH, and Master/Agent communication"
  vpc_id      = var.vpc_id

  # SSH Access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Tighten this to your IP in production
  }

  # Jenkins Web UI (Master Only)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins Agent inbound communication port (JNLP)
  ingress {
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 1. Jenkins Master VM
resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile = "LabInstanceProfile"

  # Automated Installation of Jenkins Master
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install openjdk-17-jdk -y
              EOF

  tags = { Name = "jenkins-master" }
}

# 2. Jenkins Slave / Agent VM
resource "aws_instance" "jenkins_slave" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile = "LabInstanceProfile"

  # Automated Setup of Jenkins Agent (Needs Java and runtime dependencies)
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install openjdk-17-jdk git build-essential -y
              sudo mkdir -p /var/jenkins
              sudo chown -R ubuntu:ubuntu /var/jenkins
              EOF

  tags = { Name = "jenkins-slave-agent" }
}