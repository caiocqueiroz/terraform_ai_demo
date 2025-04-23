Write-Host "This script will delete all terraform state files on the machine and Azure Blob Storage" -ForegroundColor Yellow
$confirmation = Read-Host "Are you Sure You Want To Proceed? (yes/no)"

if (($confirmation -eq 'yes') -or ($confirmation -eq 'y'))
{
    Write-Host "Clean .terraform directories" -ForegroundColor Yellow
    Write-Host "****************************************************" -ForegroundColor Yellow
    $diretorios = (Get-ChildItem -Recurse -Directory | Where-Object {$_.Name -eq ".terraform"})

    if($diretorios.Count -eq 0)
    {
        Write-Host "No directories to delete" -ForegroundColor green
    }
    else 
    {
        Write-Host "Deleting directories"
        foreach ($diretorio in $diretorios) 
        {
            Write-Host "Deleting directory: $diretorio"
            Remove-Item -Path $diretorio -Recurse -Force
        }
    }

    Write-Host "`n`nClean Terraform files .terraform.lock.hcl, terraform.tfstate,terraform.tfstate.backups" -ForegroundColor Yellow
    Write-Host "****************************************************" -ForegroundColor Yellow
    $files = (Get-ChildItem -Recurse | Where-Object {($_.Name -eq ".terraform.lock.hcl") -or ($_.Name -eq "terraform.tfstate") -or ($_.Name -eq "terraform.tfstate.backup") -or ($_.Name -eq "main.tfplan") })
    if($files.Count -eq 0)
    {
        Write-Host "No files to delete" -ForegroundColor green
    }
    else 
    {
        Write-Host "Deleting files"
        foreach ($file in $files) 
        {
            Write-Host "Deleting file: $file"
            Remove-Item -Path $file -Force
        }
    }

    Write-Host "`n`nClean .infracost directories" -ForegroundColor Yellow
    Write-Host "****************************************************" -ForegroundColor Yellow
    $diretorios = (Get-ChildItem -Recurse -Directory | Where-Object {$_.Name -eq ".infracost"})

    if($diretorios.Count -eq 0)
    {
        Write-Host "No directories to delete" -ForegroundColor green
    }
    else 
    {
        Write-Host "Deleting directories"
        foreach ($diretorio in $diretorios) 
        {
            Write-Host "Deleting directory: $diretorio"
            Remove-Item -Path $diretorio -Recurse -Force
        }
    }

    Write-Host "`n`nClean Storage Files" -ForegroundColor Yellow
    Write-Host "****************************************************" -ForegroundColor Yellow
    $RESOURCE_GROUP_NAME = "rg-treinamento-terraform"
    $STORAGE_ACCOUNT_NAME = "strtreinamentoterraform"
    $CONTAINER_NAME = "tfstate"

    Write-Host $RESOURCE_GROUP_NAME
    Write-Host $STORAGE_ACCOUNT_NAME
    Write-Host $CONTAINER_NAME

    # Check if the resource group exists
    $rg_exists = az group exists --name $RESOURCE_GROUP_NAME
    if ($rg_exists -eq "false") 
    {
        Write-Host "Resource group does not exist." -ForegroundColor Red
    }
    else 
    {
        # get the storage access key and store it as an environment variable:
        $ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

        # list all blobs in the container and delete them:
        $blobs = az storage blob list --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY --container-name $CONTAINER_NAME --query "[].name" -o tsv
        if($blobs.Count -eq 0)
        {
            Write-Host "No blobs to delete" -ForegroundColor green
        }
        else 
        {
            Write-Host "Deleting blobs"

            foreach ($blob in $blobs) 
            {
                Write-Host "Deleting blob: $blob"
                az storage blob delete --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY --container-name $CONTAINER_NAME --name $blob --delete-snapshots include
            }
        }
    }
}
else 
{
    Write-Host "Exiting script" -ForegroundColor Red
    exit
}