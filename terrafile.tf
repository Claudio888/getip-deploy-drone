provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-modulo"
    key    = "terraform-modulo.tfstate"
    region = "us-east-1"
  }
}

module "instancia" {
  source = "github.com/Claudio888/terraform2pipeline.git?ref=main"
  name = "Get-IP-iac"
  enable_sg = true
  env_prefix = "dev"
}

output "ip_address" {
  value = module.instancia.ip_address
}