In this example, it should be explained how to work with Terraform in modules.

Terraform modules are a way to organize the code to create resources in Terraform. Modules allow you to group resources together and reuse them in different parts of your code.

To use Terraform modules, you need to create a module with the resources you want to create and call that module in your main Terraform file.

Inside the `modules` folder are the modules that contain the definition of the resources to be created.

The `main.tf` file contains the definition of the resources to be created and calls the modules that are in the `modules` folder.

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

For more information on Terraform, see the [Terraform Modules](https://developer.hashicorp.com/terraform/language/modules/develop/structure).

