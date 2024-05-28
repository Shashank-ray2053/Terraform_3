module "vpc" {
    source = "./module/vpc"
    vpc_cidr= var.vpc_cidr
    
}

module "subnets" {

    source = "./module/subnets"
    vpc_id =module.vpc.vpc_id
    public_subnet_1 = var.public_subnet_1
    public_subnet_2 = var.public_subnet_2
    private_subnet_1 = var.private_subnet_1
    private_subnet_2 = var.private_subnet_2
    az_1 = var.az_1
    az_2 = var.az_2
}

module "internet_gateway" {

    source = "./module/internet_gateway"
    vpc_id = module.vpc.vpc_id
}

module "security_group" {

    source = "./module/security_group"
    vpc_id = module.vpc.vpc_id
    all_traffic = var.all_traffic
  
}

module "ec2" {

    source = "./module/ec2"
    ami = var.ami
    key_name = var.key_name
    instance_type = var.instance_type
    security_group_id = module.security_group.security_group_id
    public_subnet_1 = module.subnets.public_subnet_1
    public_subnet_2 = module.subnets.public_subnet_2
  
}

