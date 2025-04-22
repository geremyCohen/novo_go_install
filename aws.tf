terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

# Canonical, Ubuntu, 24.04, arm64 noble image


resource "aws_instance" "app_server" {
  ami           = "ami-0e8c824f386e1de06"
  instance_type = "c7g.4xlarge"

  key_name = "gcohen1"
  tags = {
    Name = "ExampleAppServerInstance"
  }
  user_data = file("/Users/gercoh01/customer/forked_bench/install_dependencies_aws.sh")
}
