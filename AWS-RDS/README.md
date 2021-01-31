#### Setup AWS-RDS step by step####

Here we are Create AWS-RDS with maridb using terraform (Terraform v0.13.5) + visualstudio (version 1.51.1)

As  requirement we have to create below configuration step by step.

1)Subnet-Group : Will provide subnet (Network range) for database Instance.

Create and setup three files which are represent AWS-RDS enviroment EX. 
  > createinstance.tf  : contains aws instance for connect our RDS-mariadb.
  > provider.tf        : contains our provider as AWS.
  > variable.tf        : contains veriables for AWS resource create for RDS- maridb EX. Access_key, Reagion. AMI and public-private_keys.

2)Parameters-Group : will contains RDBMS settings.
  Create RDS-Mariadb perametesrs for launch RDS instance.
  
  > rds.tf            : contains RDS subnet, mariaDB family,version, disk, storagetype, instance-class, user, password and etc..  

3)Security-Group : Will allows incoming traffic for RDBMS.

  Create Security group for connect application (instance) to database which allow inbound-outbound traffic.
  
  >security_group.tf  : contains instans egress and ingress traffic. for port 3306 maridb port.
  
4) Create Security key for connect EC2 instance (connect from public)

  > #ssh-keygen -f aitsolutionrhev_key
  
5) Now  go to your working directory "AWS-RDS" Initializing provider plugins...

  > #terraform init

* hashicorp/aws: version = "~> 3.26.0"

Terraform has been successfully initialized!

6) Plan your terraform 

> #terraform plan  : terraform plan check your configuration and plan accordingly to your all *.tf (total 19 resources will create)

7) Apply your terraform plan

> #terraform apply : apply terraform plan and resources create as per plan ex. Instance, seuritygroups, Subnets, RDS-service and Maridb database.
########################################################END####################################################

