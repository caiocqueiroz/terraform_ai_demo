In this example, it should be explained how to work with Terraform Workspace.

Terraform Workspace is a feature that allows you to create isolated environments (DEV, HML, PRD) to test and manage your infrastructure.

By default, Terraform creates a workspace called `default`, which is the default workspace.

You can create new workspaces with the command `terraform workspace new <workspace-name>`.

To list the existing workspaces, you can use the command `terraform workspace list`.

To select a workspace, you can use the command `terraform workspace select <workspace-name>`.

To delete a workspace, you can use the command `terraform workspace delete <workspace-name>`.

To run this example, run the following commands:

```bash
# Inicializar o Terraform
terraform init

# Listar os workspaces existentes
terraform workspace list

# Criar um novo workspace
terraform workspace new dev

# terraform plan
terraform plan -out main.tfplan

# terraform apply
terraform apply "main.tfplan"

# Criar um novo workspace
terraform workspace new uat

# terraform plan
terraform plan -out main.tfplan

# terraform apply
terraform apply "main.tfplan"

# Excluir um workspace
terraform workspace delete uat
```

For more information about Terraform Workspace, refer to the [official documentation](https://www.terraform.io/docs/language/state/workspaces.html).
