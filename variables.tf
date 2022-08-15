variable "env_name" {}
variable "region" {}

############# VPC ##################

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}
variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

##### Worker_Groups ################

variable "asg_desired_capacity" {
  type    = number
  default = 1
}

variable "asg_min_size" {
  type    = number
  default = 1
}

variable "asg_max_size" {
  type    = number
  default = 1
}

variable "instance_type" {
  default = ""
}

##################################################################################
# LOCALS
##################################################################################

locals {
  env_name = var.env_name
  project  = "fueled"
  common_tags = {
    project     = local.project
    Environment = local.env_name
  }
}