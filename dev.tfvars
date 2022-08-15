env_name = "dev"
region   = "us-east-1"

############# VPC ##################

cidr            = "10.7.0.0/16"
public_subnets  = ["10.7.101.0/24", "10.7.102.0/24", "10.7.103.0/24"]
private_subnets = ["10.7.1.0/24", "10.7.2.0/24", "10.7.3.0/24"]



instance_type        = "t3.medium"
asg_desired_capacity = 1
asg_min_size         = 1
asg_max_size         = 2


