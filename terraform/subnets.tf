# Subnets
# Public
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.0.0/18"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true # Required for EKS. Instances launched in this subnet will have a public IP assigned.

  tags = {
    Name                        = "public-${var.region}a"
    "kubernetes.io/cluster/eks" = "shared" # Required for EKS. Allows EKS cluster to discover this subnet
    "kubernetes.io/role/elb"    = 1        # Required for EKS. Used by EKS to discover subnets and put Load Balancers in
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.64.0/18"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true # Required for EKS. Instances launched in this subnet will have a public IP assigned.

  tags = {
    Name                        = "public-${var.region}b"
    "kubernetes.io/cluster/eks" = "shared" # Required for EKS. Allows EKS cluster to discover this subnet
    "kubernetes.io/role/elb"    = 1        # Required for EKS. Used by EKS to discover subnets and put Load Balancers in
  }
}

# Private
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.128.0/18"
  availability_zone = "${var.region}a"

  tags = {
    Name                        = "private-${var.region}a"
    "kubernetes.io/cluster/eks" = "shared" # Required for EKS. Allows EKS cluster to discover this subnet
    "kubernetes.io/role/internal-elb" = 1        # Required for EKS. Allows EKS to deploy private ELB's
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.192.0/18"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true # Required for EKS. Instances launched in this subnet will have a public IP assigned.

  tags = {
    Name                        = "private-${var.region}b"
    "kubernetes.io/cluster/eks" = "shared" # Required for EKS. Allows EKS cluster to discover this subnet
    "kubernetes.io/role/internal-elb" = 1        # Required for EKS. Allows EKS to deploy provate ELB's
  }
}