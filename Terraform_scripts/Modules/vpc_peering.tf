resource "aws_vpc_peering_connection" "vpc-peering" {
    vpc_id  = aws_vpc.vpc.id
    peer_owner_id = var.peer_owner
    peer_vpc_id   =  var.peer_vpc_id
    peer_region =  var.peer_region
    /*---if both the vpc are in same account and same region auto_accept is true */
    auto_accept = false
    tags = {
    Name    = "${var.PROJECT_NAME}-vpc-peering"
  }
}
