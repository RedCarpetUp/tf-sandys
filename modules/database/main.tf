###############################################################################
# Data Sources
###############################################################################
data "aws_availability_zones" "available" {
  filter {
    name   = "region-name"
    values = [var.region]
  }
}

###############################################################################
# Security Groups
###############################################################################
resource "aws_security_group" "rds_sg" {
  description = "Port 3306 database for access"
  vpc_id      = var.ProductionVPC

  egress {
    from_port   = 1
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-database-access"
    Environment = var.environment
  }
}


###############################################################################
# Database
###############################################################################
resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.rds_count
  identifier         = "${var.rds_name}-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora.engine
  engine_version     = aws_rds_cluster.aurora.engine_version
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier     = var.rds_name
  database_name          = var.database_name
  master_username        = var.master_username
  master_password        = random_string.master_password.result
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  availability_zones     = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  storage_encrypted      = true
  skip_final_snapshot    = true
  engine                 = var.engine
  engine_version         = var.engine_version
  db_subnet_group_name   = aws_db_subnet_group.aurora_subnet_group.name
}

resource "aws_db_subnet_group" "aurora_subnet_group" {

  name        = "aurora-cluster-demo-aurora-db-subnet-group"
  description = "Allowed subnets for Aurora DB cluster instances"
  subnet_ids = [
    var.DB_subnetA,
    var.DB_subnetB
  ]

  tags = {
    Name        = "aurora-cluster-demo-Aurora-DB-Subnet-Group"
    Environment = var.environment
  }

}

resource "random_string" "master_password" {
  length  = 10
  special = false
  lower   = true
  upper   = true
  number  = true
}

resource "aws_ssm_parameter" "rds_pwd_ssm" {

  name  = "RDSPassword"
  type  = "SecureString"
  value = random_string.master_password.result
}
