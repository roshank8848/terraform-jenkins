variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "Ubuntu 26.04 LTS or similar Debian-based AMI ID"
  default     = "ami-091138d0f0d41ff90" # Replace with your specific region's Ubuntu AMI
}