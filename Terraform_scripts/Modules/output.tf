output "vpc_id" {
    value = aws_vpc.vpc.id
}
output "subnet_id-pub" {
    value = aws_subnet.public-subnet.id
}
output "subnet_id-prv-service" {
    value = aws_subnet.private-service-subnet.id
}
output "subnet_id-prv-data" {
    value = aws_subnet.private-data-subnet.id
}
output "sg_id_bastion" {
    value = aws_security_group.bastion-sg.id
}
output "sg_id_data" {
    value = aws_security_group.data-sg.id
}
output "sg_id_service" {
    value = aws_security_group.service-sg.id
}

output "peering_id" {
    value = aws_vpc_peering_connection.vpc-peering.id
}
