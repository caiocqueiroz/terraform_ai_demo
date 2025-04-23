# List of resource groups to delete
$resourceGroups = @("rg-exe01", "rg-exe02", "rg-exe03", "rg-exe04-dev", "rg-exe05-dev", "rg-exe06-dev", "rg-exe06-uat", "rg-exe07-dev", "rg-exe08tfvars-dev", "rg-exe08tfvars-hml")

Write-Host "This script will delete all resources groups created by terraform samples" -ForegroundColor Yellow
Write-Host "Resource groups to be deleted:"
$resourceGroups | ForEach-Object { Write-Host "  " $_ }

$confirmation = Read-Host "Are you Sure You Want To Proceed? (yes/no)"

if (($confirmation -eq 'yes') -or ($confirmation -eq 'y'))
{
    foreach ($rg in $resourceGroups) 
    {
        try 
        {
            Write-Host "****************************************************" -ForegroundColor Yellow
            Write-Host "Deleting resource group: $rg"  -ForegroundColor Yellow
            az group delete --name $rg --yes --no-wait
            Write-Host "Successfully initiated deletion of resource group: $rg`n"
        } 
        catch 
        {
            Write-Host "Failed to delete resource group: $rg"
            Write-Host $_.Exception.Message
        }
    }
}