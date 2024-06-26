terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 1.0"
    }
  }
}

provider "aws" {
  profile = "alvo"
  region = "us-east-1"
}