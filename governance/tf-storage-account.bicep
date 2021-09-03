@minLength(3)
@maxLength(24)
param name string = 'tfstatesarbhadti'
param location string = 'UK South'
param kind string = 'StorageV2'
param storageSKU string = 'Standard_RAGZRS'

module tfStateAccount '../modules/bicep/StorageAccount.bicep' = {
  name: 'TerraformStateStorageAccount'
  params: {
    storageAccountName: name
    location: location
    storageSKU: storageSKU
    kind: kind
  }
}

output storageEndpoint object = tfStateAccount.outputs.storageAccountEndpoints
