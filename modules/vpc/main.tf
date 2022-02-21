resource "aws_vpc" "RDS-vpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "RDS-subnet-public-1" {
    
    vpc_id = aws_vpc.RDS-vpc.id
    
    cidr_block = "10.0.1.0/24"
    
    availability_zone = var.availability-zone1
    
}

resource "aws_subnet" "RDS-subnet-public-2" {

    vpc_id = aws_vpc.RDS-vpc.id

    cidr_block = "10.0.3.0/24"

    availability_zone = var.availability-zone2

}


resource "aws_internet_gateway" "RDS-igw" {
    vpc_id = aws_vpc.RDS-vpc.id
}


resource "aws_route_table" "RDS-public-crt" {
    vpc_id = aws_vpc.RDS-vpc.id
    
    route {
        //associated subnet can reach everywhere
      
        cidr_block = "0.0.0.0/0" 
        
        //CRT uses this IGW to reach internet
        
        gateway_id = aws_internet_gateway.RDS-igw.id
    }
    
}


resource "aws_route_table_association" "RDS-crta-public-subnet-1"{
    
    subnet_id = aws_subnet.RDS-subnet-public-1.id
    route_table_id = aws_route_table.RDS-public-crt.id
}



resource "aws_security_group" "ssh-allowed" {
    vpc_id = aws_vpc.RDS-vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production.
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the NGIX
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
