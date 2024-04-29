
//nat Gatway


resource "aws_eip" "nat_eip" {
  //vpc = true
  domain = "vpc"

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "k8s-nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "k8s-nat"
  }

  depends_on = [aws_internet_gateway.k8svpc-igw]
}


//routes

// routing table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.k8svpc.id

  route {
      cidr_block                 = var.egress_route2
      nat_gateway_id             = aws_nat_gateway.k8s-nat.id
    }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.k8svpc.id

  route {
      cidr_block                 = var.egress_route2
      gateway_id                 = aws_internet_gateway.k8svpc-igw.id
    }

  tags = {
    Name = "public"
  }
}


// routing table association

resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-us-east-1b" {
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.public.id
}

