In this example, we will see how to use Terraform to test the infrastructure.

Terraform has a feature called `terraform test` that allows you to test the infrastructure before applying it.

To run this example, execute the following commands:

```bash
# terraform init
terraform init

# terraform test
terraform test

# terraform test -var-file="ambiente-teste.tfvars"
terraform test -var-file="ambiente-teste.tfvars"
```

For more information, see the [official Terraform cli test command](https://www.terraform.io/docs/cli/commands/test.html) and the [Terraform testing documentation](https://developer.hashicorp.com/terraform/language/tests).