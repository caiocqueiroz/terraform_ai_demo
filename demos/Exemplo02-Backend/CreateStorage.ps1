$RESOURCE_GROUP_NAME = "rg-treinamento-terraform"
$STORAGE_ACCOUNT_NAME = "strtreinamentoterraform"
$CONTAINER_NAME = "tfstate"

# check if the resource group already exists
$resourceGroupExists = az group exists --name $RESOURCE_GROUP_NAME

if($resourceGroupExists -eq "true")
{
    Write-Host "Resource group $RESOURCE_GROUP_NAME already exists" -ForegroundColor Yellow
}
else
{
    Write-Host "Creating resource group $RESOURCE_GROUP_NAME" -ForegroundColor Yellow
    az group create --name $RESOURCE_GROUP_NAME --location eastus
}

# check if the storage account already exists
$storageAccountExists = az storage account check-name --name $STORAGE_ACCOUNT_NAME | ConvertFrom-Json

if ($storageAccountExists.nameAvailable -eq $false) 
{
    Write-Host "Storage account $STORAGE_ACCOUNT_NAME already exists" -ForegroundColor Yellow
} 
else 
{
    Write-Host "Creating storage account $STORAGE_ACCOUNT_NAME" -ForegroundColor Yellow
    az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
}

# check if the container already exists
$containerExists = az storage container exists --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME | ConvertFrom-Json

if($containerExists.exists -eq "true")
{
    Write-Host "Container $CONTAINER_NAME already exists" -ForegroundColor Yellow
}
else
{
    Write-Host "Creating container $CONTAINER_NAME" -ForegroundColor Yellow
    az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
}

$ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

Write-Host "Storage Account Key" -ForegroundColor Yellow
Write-Host $ACCOUNT_KEY