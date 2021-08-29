targetScope = 'subscription'

@minLength(3)
@maxLength(24)
param resourceGroupName string = 'tfstate-rg'
param location string = 'UK South'

module tfStateAccount '../modules/bicep/ResourceGroup.bicep' = {
  name: 'TerraformStateResourceGroup'
  params: {
    resourceGroupName: resourceGroupName
    location: location
  }
}
