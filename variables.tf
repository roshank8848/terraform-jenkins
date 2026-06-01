variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "Ubuntu 22.04 LTS or similar Debian-based AMI ID"
  default     = "ami-0c7217cdde317cfec" # Replace with your specific region's Ubuntu AMI
}