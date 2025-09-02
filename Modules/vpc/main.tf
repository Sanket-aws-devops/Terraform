resource "aws_vpc" "temp" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = "temp"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.temp.id
  cidr_block = var.public_subnet_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true 

  tags = {
    Name = "public"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.temp.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.temp.id
  
  route {
    cidr_block = var.allowed_http_cidr
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
