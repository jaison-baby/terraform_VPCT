
output "vpcid" {
  value = aws_vpc.RDS-vpc.id
}

output "subnetid" {
  value = aws_subnet.RDS-subnet-public-1.id
}
output "gatewayid" {
  value = aws_internet_gateway.RDS-igw.id
}
output "subnetid2" {
  value = aws_subnet.RDS-subnet-public-2.id
}
