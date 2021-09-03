targetScope = 'subscription'

param resourceGroupName string

@allowed([
  'UK South'
])
param location string

resource ResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

output resourceGroupId string = ResourceGroup.id
