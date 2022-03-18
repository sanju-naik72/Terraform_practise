variable "vpc_cidr"{

}
variable "publicsubnet-cidr"{

}
variable "prv-service-subnet-cidr"{

}
variable "prv-data-subnet-cidr"{

}

variable "az-public-subnet"{
    
}
variable "az-prv-service-subnet"{
    
}
variable "az-prv-data-subnet"{
    
}

variable "vpc_id"{

}
variable "subnet_id-pub"{

}
variable "subnet_id-prv-service"{

}
variable "subnet_id-prv-data"{

}
variable "PROJECT_NAME"{

}
/*------------SecurityGroups Variables------------------*/

variable "bastion-ingressports"{
    type = list(number)
}
variable "bastion-egressports"{
    type = list(number)
}
variable "data-ingressports"{
    type = list(number)
}
variable "data-egressports"{
    type = list(number)
}
variable "service-ingressports"{
    type = list(number)
}
variable "service-egressports"{
    type = list(number)
}
variable "sg_bastion_cidr_blocks"{
    default = []
}
variable "sg_service_cidr_blocks"{
   default = []
}
variable "sg_data_cidr_blocks"{
    default = []
}
variable "sg_id_bastion"{
    type = string
}
variable "sg_id_data"{
     type = string
}
variable "sg_id_service"{
     type = string
}

/*-------------Bastion Variables---------------}*/

variable "bastion-ami"{

}
variable "bastion-type"{

}
    


/*-----------Vpc-Peering-----------------*/

variable "peer_owner"{

}
variable "peer_vpc_id"{

}
variable "peer_region"{

}
variable "peer_cidr"{
    
}

variable "peering_id"{
    
}