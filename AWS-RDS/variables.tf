variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAUDFTF23VANWG4EF3"
}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
default = "ap-south-1"
}

variable "AMIS" {
    type = map
    default = {
        ap-south-1 = "ami-0a4a70bd98c6d6441"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "itsolutionrhev_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "itsolutionrhev_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}