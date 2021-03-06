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

variable "environment" {
  description = "Name of the environment for the deployment, e.g. Integration, PreProduction, Production, QA, Staging, Test."
}

variable "productioncidr" {
  description = "Production VPC CIDR block."
}

variable "bastionsshcidr" {
  description = "Bastion CIDR block."
}

variable "managementcidr" {
  description = "Management CIDR block."
}

###############################################################################
# Variables - Production VPC
###############################################################################
variable "vpc_name" {
  description = "Production VPC Name."
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

###############################################################################
# Variables - Management VPC
###############################################################################
variable "managementvpcname" {
  description = "Management VPC Name"
}

variable "ManagementDMZSubnetACIDR" {
  description = "DMZ CIDR block A."
}

variable "ManagementDMZSubnetBCIDR" {
  description = "DMZ CIDR block B."
}

variable "ManagementPrivateSubnetACIDR" {
  description = "Private CIDR block A."
}

variable "ManagementPrivateSubnetBCIDR" {
  description = "Private CIDR block B."
}

variable "ec2keypairbastion" {
  description = "Bastion Host Key Pair."
}

variable "bastioninstancetype" {
  description = "Bastion Host Instance Type."
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
}

###############################################################################
# Variables - IAM Password Policy
###############################################################################
variable "minimum_password_length" {
  description = "Minimum password length. (8-128 characters)"
  default     = "7"
}

variable "require_lowercase_characters" {
  description = "Password requirement of at least one lowercase character."
}

variable "require_numbers" {
  description = "Password requirement of at least one number."
}

variable "require_uppercase_characters" {
  description = "Password requirement of at least one uppercase character."
}

variable "require_symbols" {
  description = "Password requirement of at least one nonalphanumeric character."
}

variable "max_password_age" {
  description = "Maximum age for passwords, in number of days. (90-365 days)"
  default     = "90"
}

variable "password_reuse_prevention" {
  description = "Number of previous passwords to remember. (1-24 passwords)"
}

###############################################################################
# Logging
###############################################################################
variable "BucketName" {
  description = "The name of a new S3 bucket for logging CloudTrail events. The name must be a globally unique value and must be in lowercase letters."
}

variable "CloudTrailName" {
  description = "The name of a new S3 bucket for logging CloudTrail events. The name must be a globally unique value and must be in lowercase letters."
}

###############################################################################
# Variables - RDS
###############################################################################
variable "rds_name" {
  description = "Name of the RDS cluster."
}

variable "rds_count" {
  description = "Number of RDS instances to deploy."
}

variable "database_name" {
  description = "Database Name."
}

variable "master_username" {
  description = "Master Username for the Database."
}

variable "engine" {
  description = "Database Engine to use."
}

variable "engine_version" {
  description = "Database Engine version to use."
}

variable "instance_class" {
  description = "Database Instance class to use."
}

###############################################################################
# Variables - Application
###############################################################################
variable "instance_type" {
  description = "Instance type to use in the Launch Configuration."
}

variable "desired_capacity" {
  description = "Desired Capacity for number of instances running all the time."
}

variable "max_size" {
  description = "Maximum number of instances running all the time."
}

variable "min_size" {
  description = "Minimum number of instances running all the time."
}
