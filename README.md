# Project Bedrock - InnovateMart EKS Deployment

## Project Overview
**Project Bedrock** is the dployment of InnovateMart's new Retail store Application to a production-grade kubernetes environment on AWS EKS. This project demonstrates cloud infrastructure design, microservices deployment, IAM security, and CI/CD automation using Terraform and GitHub Actions.

---

## Folder Structure

project-bedrock
├── README.md
├── deployment-architecture-guide.pdf
├── docs
│   └── kubeconfig-dev-user.md
├── k8s
│   ├── base
│   │   ├── mysql
│   │   │   ├── mysql-deployment.yaml
│   │   │   └── mysql-pvc.yaml
│   │   ├── postgres
│   │   ├── project-bedrock
│   │   ├── rabbitmq
│   │   └── redis
│   └── overlays
└── terraform
    ├── backend.tf
    ├── main.tf
    ├── modules
    │   ├── eks
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── iam
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── vpc
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    ├── outputs.tf
    ├── providers.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.d
    │   └── temp
    │       └── terraform.tfstate
    ├── terraform.tfvars
    ├── tfplan
    └── variables.tf

---

## Terraform Deployment Instructions

1. Clone the repository
```bash
git clone https://github.com/BIT-29/project-bedrock
cd terraform
```
2. Initialize Terraform
terraform init

3. plan Infrastructure
terraform plan -out=tfplan

4. Apply infrastructure
terraform apply tfplan

---

## CI/CD Overview

The GitHub Actions workflow automates Terraform deployment:
**Feature branches:** Trigger terraform plan
**Main branch:** Trigger terraform apply
Uses **AWS OIDC** for secure role assumption
AWS credentials are managed via repository secrets (AWS_OIDC_ROLE_ARN)

## Developer Access

Planned read-only IAM user:
**Username:** dev-readonly
**Permissions:** Describe EKS cluster, list clusters, view CloudWatch logs, get metrics
**Access Instuctions:** Use AWS CLI or console to view cluster resources without modifying them


---

## Deployment Architecture Guide

**1. Infrastructure Overview**

- **VPC**  
  - CIDR: `10.0.0.0/16`  
  - 2 Availability Zones: `us-east-1a`, `us-east-1b`  
  - Public Subnets: `10.0.1.0/24`, `10.0.2.0/24`  
  - Private Subnets: `10.0.11.0/24`, `10.0.12.0/24`  
  - NAT Gateway for outbound internet from private subnets  
  - DNS support enabled  

- **EKS Cluster**  
  - Cluster Name: `bedrock-cluster`  
  - Kubernetes Version: `1.29`  
  - Managed Node Group: `t3.medium` instances  
  - 1–3 nodes per cluster  
  - Private subnet deployment  

- **IAM Users**  
  - Read-only developer user (`dev-readonly`)  
  - Least-privilege policy for monitoring and viewing logs  

- **S3 Backend & DynamoDB**  
  - S3 Bucket: `project-bedrock-tfstate-new` (Terraform state storage)  
  - DynamoDB Table: `project-bedrock-tf-lock` (state lock)

---

**2. Application Deployment**

- **Retail Store Application** deployed on EKS  
- Microservices architecture:  
  - Service A, Service B, Service C (example placeholders)  
- In-cluster dependencies:  
  - MySQL  
  - Redis  
  - RabbitMQ  

- **Kubernetes manifests:** Located in `k8s/` folder

---

**3. Developer Access Instructions**

1. AWS Console / CLI login using `dev-readonly` user credentials  
2. List EKS clusters:

```bash
aws eks list-clusters --region us-east-1
