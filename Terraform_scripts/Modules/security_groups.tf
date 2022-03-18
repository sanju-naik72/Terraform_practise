/*-----------Bastion-Security-Groups-------------------*/

resource "aws_security_group" "bastion-sg"{
    name = "bastion-sg"

    dynamic "ingress"{
        iterator = port
        for_each = var.bastion-ingressports
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = var.sg_bastion_cidr_blocks
        }
    }
    dynamic "egress"{
        iterator = port
        for_each = var.bastion-egressports
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
        Name = "${var.PROJECT_NAME}-bastion-sg"
    }
}

/*----------------------Data Security Groups-------------------*/

resource "aws_security_group" "data-sg"{
    name = "data-sg"

    dynamic "ingress"{
        iterator = port
        for_each = var.data-ingressports
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = var.sg_data_cidr_blocks
        }
    }
    dynamic "egress"{
        iterator = port
        for_each = var.data-egressports
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    tags = {
        Name = "${var.PROJECT_NAME}-data-sg"
    }
}

/*------------------------Service Security Groups---------------------*/

resource "aws_security_group" "service-sg"{
    name = "service-sg"

    dynamic "ingress"{
        iterator = port
        for_each = var.service-ingressports
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = var.sg_service_cidr_blocks
        }
    }
    dynamic "egress"{
        iterator = port
        for_each = var.service-egressports
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    tags = {
        Name = "${var.PROJECT_NAME}-service-sg"
    }
}