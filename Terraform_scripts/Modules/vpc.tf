/*-------------------- Create a vpc----------------------------*/
 resource aws_vpc "vpc"{
     cidr_block = var.vpc_cidr
     tags = {
         Name = "${var.PROJECT_NAME}--vpc"
     }
 }


/*------------create one public subnet and two private subnet-----------*/

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.publicsubnet-cidr
  availability_zone = var.az-public-subnet

  tags = {
    Name = "${var.PROJECT_NAME}-public-subnet"
  }
}

resource "aws_subnet" "private-service-subnet"{
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.prv-service-subnet-cidr
    availability_zone = var.az-prv-service-subnet
    tags = {
    Name = "${var.PROJECT_NAME}-private-service-subnet"
  }
}

resource "aws_subnet" "private-data-subnet"{
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.prv-data-subnet-cidr
    availability_zone = var.az-prv-data-subnet

    tags = {
    Name = "${var.PROJECT_NAME}-private-data-subnet"
  }
}

/*-------------Create internet gateway---------------------*/

resource "aws_internet_gateway" "internet-gate-way" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.PROJECT_NAME}-igw"
  }
}

/*------------------Create a Nat gateway-----------------*/

resource aws_eip "eip"{
    tags = {
        Name = "${var.PROJECT_NAME}-eip"
    }
}

resource "aws_nat_gateway" "NAT-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "${var.PROJECT_NAME}-nat-gateway"
  }
}

/*---------------Create route tables for both public and private subnet------------------*/

resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc.id

  route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.internet-gate-way.id
  }

  route {
            vpc_peering_connection_id = aws_vpc_peering_connection.vpc-peering.id
            cidr_block = var.peer_cidr
  }

   tags = {
    Name = "${var.PROJECT_NAME}-rt-public"
  }
}

resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.NAT-gateway.id
  }

   tags = {
    Name = "${var.PROJECT_NAME}-rt-private"
  }
}

/*----------------------------Route table Association------------------------*/

resource "aws_route_table_association" "rt-assoc-public-subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt-public.id

}

resource "aws_route_table_association" "rt-assoc-prv-service-subnet" {
  subnet_id      = aws_subnet.private-service-subnet.id
  route_table_id = aws_route_table.rt-private.id

}
resource "aws_route_table_association" "rt-assoc-prv-data-subnet" {
  subnet_id      = aws_subnet.private-data-subnet.id
  route_table_id = aws_route_table.rt-private.id

}