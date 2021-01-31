#AWS RDS Resources
resource "aws_db_subnet_group" "mariadb-subnets" {
  name        = "mariadb-subnets"
  description = "Amazon RDS subnet group"
  subnet_ids  = [aws_subnet.itsolutionrhevvpc-private-1.id, aws_subnet.itsolutionrhevvpc-private-2.id]
}

#RDS Parameters
resource "aws_db_parameter_group" "itsolutionrhev-mariadb-parameters" {
  name        = "itsolutionrhev-mariadb-parameters"
  family      = "mariadb10.4"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

#Mariadb Instance properties
resource "aws_db_instance" "itsolutionrhev-mariadb" {
  allocated_storage       = 20             # 20 GB of storage for database /var/lib/myswl
  engine                  = "mariadb"
  engine_version          = "10.4.8"
  instance_class          = "db.t2.micro"  # free instance for AWS RDBMS t2.micro
  identifier              = "mariadb"
  name                    = "mariadb"
  username                = "root"           # username of database
  password                = "solution987"     # password of database
  db_subnet_group_name    = aws_db_subnet_group.mariadb-subnets.name
  parameter_group_name    = aws_db_parameter_group.itsolutionrhev-mariadb-parameters.name
  multi_az                = "false"            # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids  = [aws_security_group.allow-mariadb.id]
  storage_type            = "gp2"
  backup_retention_period = 30                                          # how long you’re going to keep your backups
  availability_zone       = aws_subnet.itsolutionrhevvpc-private-1.availability_zone # prefered AZ
  skip_final_snapshot     = true                                        # skip final snapshot when doing terraform destroy
  
  tags = {
    Name = "itsolutionrhev-mariadb"
  }
}

output "rds" {
  value = aws_db_instance.itsolutionrhev-mariadb.endpoint
}

