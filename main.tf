terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
      }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "app_server" {
    ami = "ami-0efce49721f2fecff"
    instance_type = "t2.micro"

    tags = {
        Name = "FirstAppServerInstance"
    }
}