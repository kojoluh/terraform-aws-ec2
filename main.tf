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

data "aws_ami" "amzLinux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-gp2"]
    }
    filter {
        name = "root-device-type"
        values =["ebs"]
    }
    filter {
        name = "virtualization-type"
        values =["hvm"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

resource "aws_instance" "app_server" {
    ami = data.aws_ami.amzLinux.id
    instance_type = var.ec2_instance_type

    tags = {
        Name = var.instance_name
    }
}