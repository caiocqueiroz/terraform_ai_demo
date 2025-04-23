In the last example, we used a remote backend to store the Terraform state in an Azure Storage Account. But we stored the access_key in the `main.tf` file. This is not a good practice because the access_key is a sensitive information and should not be stored in the Terraform script.

In this example, we will use an environment variable to store the access key to the blob storage.

To run this example, follow these steps:

1. Create an environment variable called `ARM_ACCESS_KEY` and assign it the access key to the blob storage. You can run the PowerShell script `SetBackend.ps1` located in the folder.
2. Run the following commands:

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

After running these commands, Terraform will create the infrastructure on Azure using the remote backend.

You can access the web app clicking on the URL displayed in the output.

For more information on environment variables, see the [Terraform AzureRM provider](https://developer.hashicorp.com/terraform/language/backend/azurerm).