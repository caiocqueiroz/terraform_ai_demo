Show a basic example of using Terraform

This is a Terraform script that creates infrastructure on Azure. Here is what each part of the script does:

- Configures the Azure provider
- Generates a random integer
- Creates a resource group "rg-exe01" in the "East US" region
- Creates a Linux App Service plan based on the random integer
- Creates a Linux web app based on the random integer
- The last part of the script is a output block that will display the URL of the created web app.

To run this example, follow these steps:

1. Install Terraform on your computer.
2. Create an Azure account and log in.
3. Update the `main.tf` file with your Azure subscription ID.
4. Run the following commands:

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

After running these commands, Terraform will create the infrastructure on Azure. You can access the web app clicking on the URL displayed in the output.

For more information on Terraform, see the [Terraform documentation](https://www.terraform.io/docs/index.html). 
```