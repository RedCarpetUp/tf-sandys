###############################################################################
# Variables - Environment
###############################################################################
variable "aws_account_id" {
  description = "AWS Account ID."
}

variable "region" {
  description = "Default Region."
  default     = "ap-southeast-2"
}

# ###############################################################################
# # Variables - Production VPC
# ###############################################################################
variable "vpc_name" {
  description = "Production VPC Name"
}

variable "environment" {
  description = "Name of the environment for the deployment, e.g. Integration, PreProduction, Production, QA, Staging, Test."
}

variable "cidr_block" {
  description = "Production VPC CIDR block."
}

variable "bastionsshcidr" {
  description = "Bastion CIDR block."
}

variable "managementcidr" {
  description = "Management CIDR block."
}

variable "DMZSubnetACIDR" {
  description = "DMZ CIDR block A."
}

variable "DMZSubnetBCIDR" {
  description = "DMZ CIDR block B."
}

variable "AppPrivateSubnetA" {
  description = "App CIDR block A."
}

variable "AppPrivateSubnetB" {
  description = "App CIDR block B."
}

variable "DBPrivateSubnetA" {
  description = "DB CIDR block A."
}

variable "DBPrivateSubnetB" {
  description = "DB CIDR block B."
}
