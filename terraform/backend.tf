terraform {
  backend "s3" {
    bucket         = "project-bedrock-tfstate-new"
    key            = "eks-new/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "project-bedrock-tf-lock-new"
    encrypt        = true
  }
}
