terraform {
  backend "s3" {
    bucket         = "project-bedrock-tfstate-uyi-101134489152"
    key            = "eks-new/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "project-bedrock-tf-lock"
    encrypt        = true
  }
}
