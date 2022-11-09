# Internet Gateway
resource "aws_internet_gateway" "internet_gateway_main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}