# VPC
resource "aws_vpc" "main" {
  cidr_block                       = "192.168.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true # Required for EKS. Enable DNS support in the VPC
  enable_dns_hostnames             = true # Required for EKS. Enable DNS hostnames in the VPC
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "main"
  }
}

output "vpc_id" {
  value       = aws_vpc.main.id
  sensitive   = false
  description = "Main VPC ID"
}
