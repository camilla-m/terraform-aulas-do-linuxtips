provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket  = "descomplicando-terraform-punkdodevops-tfstates"
    key     = "terraform-test.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}