This example is the same as the previous one (Exemplo01-Basic), but with a remote backend.

The remote backend is a feature that allows Terraform to store its state in a remote location, such as in a blob storage on Azure.

This is useful when you are working in a team or on multiple computers, as it allows everyone to share the same state.

The remote backend is also useful for keeping the state secure and protected, as it is stored in a remote location and not on your local computer.

To use a remote backend, you need to configure it in the Terraform script using the `backend` block.

In this example, we are using an Azure Storage Account as the remote backend.

To run this example, follow these steps:

1. Create a new Azure Storage Account to use as the remote backend. Run the script file `CreateStorage.ps1`.
2. Update the `main.tf` file with the details of the Azure Storage Account. Please set the `access_key` value with the key generated in step 1. 
3. Configure the subscription ID environment variable by running the following command:

```bash
$env:ARM_SUBSCRIPTION_ID="e84af34a-bbd2-4d60-8776-829485d3e735"
```

> NOTE: In the **Exemplo01-Basic** we set the subscription ID in the `main.tf` file. In this example, we are setting it as an environment variable.

3. Run the following commands:

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

Access the azure portal and show the files created in the storage account.

You can access the web app clicking on the URL displayed in the output.

For more information on remote backends, see the [Terraform AzureRM provider](https://developer.hashicorp.com/terraform/language/backend/azurerm).