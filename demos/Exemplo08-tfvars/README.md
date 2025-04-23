In this example, we will start using a `terraform.tfvars` file to store environment variables.

The idea is to create a `terraform.tfvars` file for each environment (dev, hml, prd) and use it to store the environment variables.

The `terraform.tfvars` file is a simple text file that contains the variables and values that will be used by Terraform to create the resources.


```powershell
terraform init

terraform plan -var-file="ambiente-dev.tfvars" -out="main-dev.tfplan"
terraform apply "main-dev.tfplan"

terraform plan -var-file="ambiente-hml.tfvars" -out="main-hml.tfplan"
terraform apply "main-hml.tfplan"
```

For more information, see the [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html#variable-definitions-tfvars-files).