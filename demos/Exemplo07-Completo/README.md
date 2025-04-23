The idea of this example is to add a bit more complexity to the environment. In this example, additional Terraform modules were added to create resources on Azure.

- ACR - Azure Container Registry
- AKS - Azure Kubernetes Service

To run this example, run the following commands:

```bash
# terraform init
terraform init

# terraform validate
terraform validate

# terraform plan
terraform plan -out main.tfplan

# terraform apply
terraform apply "main.tfplan"
```