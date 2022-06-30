provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Owner   = "Jessenia"
      Project = "TerraformWorkshop"
    }
  }
}

module "fd_resource_registry" {
  source = "git@github.com:fanduel/tf-module-fd-resource-registry.git//?ref=v1.4.12"
}

locals {
  public_subnet       = module.fd_resource_registry.accounts["development"]["vpcs"]["main"]["subnets"]["public"]["main"][0]
  vpc_id              = module.fd_resource_registry.accounts["development"]["vpcs"]["main"]["vpc_id"]
  service_name_prefix = "tutorial-jessenia-${var.deploy_environment}-${var.deploy_context}"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04169656fea786776"
  instance_type = "t2.large"
  subnet_id     = local.public_subnet

  tags = {
    Name = "${local.service_name_prefix}-app_server"
  }
}

