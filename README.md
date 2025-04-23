# Terraform Workshop

This repository is intended for the Terraform workshop, focusing on the implementation of infrastructure as code (IaC) on Azure. The workshop covers various examples and modules that demonstrate the use of Terraform to manage and provision resources on Azure.

## Prerequisites

To run the examples and modules in this workshop, you will need to have the following prerequisites installed on your machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Git](https://git-scm.com/downloads)
- [GitHub Account](https://github.com)

## PPT Decks

The PPT decks used in the workshop can be found in the [decks](decks/) folder.

- Module 01 - Infrastructure as Code
- Module 02 - Terraform Introduction
- Module 03 - Terraform Basic
- Module 04 - Terraform Modules
- Module 05 - Terraform Pipeline with Azure Pipeline
- Module 06 - Terraform with GitHub Actions and Copilot

## Terraform Modules

The following Terraform modules have been created as examples to provision resources on Azure:

- Resource Group: This module creates a resource group on Azure. The code for this module can be found in [modules/resource-group](modules/resource-group/main.tf)
- Service Plan: This module creates an App Service plan on Azure. The code for this module can be found in [modules/service-plan](modules/service-plan/main.tf)
- App Service: This module creates an App Service on Azure. The code for this module can be found in [modules/app-service](modules/app-service/main.tf)
- ACR (Azure Container Registry): This module creates a container registry on Azure. The code for this module can be found in [modules/acr](modules/acr/main.tf)
- AKS (Azure Kubernetes Service): This module creates a Kubernetes service on Azure. The code for this module can be found in [modules/aks](modules/aks/main.tf)
- SQL Server: This module creates a SQL server on Azure. The code for this module can be found in [modules/sql-server](modules/sql-server/main.tf)

## Running the examples

To run the examples and modules in this workshop, follow the instructions below:

```bash
# set subscription id variable
$env:ARM_SUBSCRIPTION_ID="6701dd9b-01b4-4af0-b147-ec7beda70c8d"

# terraform init
terraform init

# terraform validate
terraform validate

# terraform format
terraform fmt

# terraform plan
terraform plan -out main.tfplan

# terraform plan with multiple variables
terraform plan -var="location=westus" -var="environment=dev" -out main.tfplan

# terraform apply
terraform apply "main.tfplan"

# terraform show
terraform show main.tfplan
terraform show -json main.tfplan > plan.json

# terraform output
terraform output
terraform output -json
terraform output -raw report
terraform output -json | jq -r '.resource_group_name.value'

# terraform graph
terraform graph | dot -Tsvg > graph.svg

# terraform plan destroy
terraform plan -destroy -out main.tfplan