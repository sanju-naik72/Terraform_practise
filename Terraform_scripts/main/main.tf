module "infrastructure"{
    source = "../Modules"

    PROJECT_NAME = "scripts"

    /*-----------vpc & subnets cidrs--------------------*/
    vpc_cidr = "172.0.0.0/16"
    publicsubnet-cidr = "172.0.0.0/24"
    prv-service-subnet-cidr = "172.0.2.0/24"
    prv-data-subnet-cidr = "172.0.1.0/24"
    az-public-subnet = "ap-south-1a"
    az-prv-service-subnet = "ap-south-1b"
    az-prv-data-subnet = "ap-south-1c"
    vpc_id = module.infrastructure.vpc_id
    subnet_id-pub = module.infrastructure.subnet_id-pub
    subnet_id-prv-service = module.infrastructure.subnet_id-prv-service
    subnet_id-prv-data = module.infrastructure.subnet_id-prv-data

    /*----inbound and outbound for bastion----------------*/  

    bastion-ingressports = [22]
    bastion-egressports = [80]
    sg_bastion_cidr_blocks = ["0.0.0.0/0"]

     /*----inbound and outbound for service--------------*/ 
    
    service-ingressports = [80,443]
    service-egressports = [80,443]
    sg_service_cidr_blocks = ["0.0.0.0/0"]

     /*----inbound and outbound for data----------------*/ 
    
    data-ingressports = [80]
    data-egressports = [80]
    sg_data_cidr_blocks = ["0.0.0.0/0"]

    /*----------------------------*/

    sg_id_bastion = module.infrastructure.sg_id_bastion
    sg_id_data = module.infrastructure.sg_id_data
    sg_id_service = module.infrastructure.sg_id_service

    /*-----Bastion Host-----------*/
    
    bastion-ami = "ami-kfjdsvjfbsdhf"
    bastion-type = "t2.large"

    /*---------vpc peering------------*/
    peer_owner = "xxxxxxxxxxxx"
    peer_vpc_id = "vpc-07a49c33b2ba4b69a"
    peer_region = "ap-south-1"
    peer_cidr = "192.168.0.0/28"
    peering_id=module.infrastructure.peering_id
}


/*-------------peering acceptor----------------*/

resource "aws_vpc_peering_connection_accepter" "acceptor"{
    provider = aws.acceptor
    vpc_peering_connection_id = module.infrastructure.peering_id
    auto_accept = true
}