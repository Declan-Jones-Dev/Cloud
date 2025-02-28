@ddescription('The name of the Log Analytics workspace.')
param workspaceName string = 'MyLogAnalyticsWorkspace'

@description('The location for the Log Analytics Workspace.')
param location string = resourceGroup().location 

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
    name: workspaceName 
    location: location 
    properties: {
        retentionInDays: 30
        sku: {
            name: 'PerGB2018
        }
    }
}

output workspaceId string = logAnalyticsWorkspace.properties.customerId
output workspaceKey string = listKeys(logAnalyticsWorkspace.id, logAnalyticsWorkspace.apiVersion).primarySharedKey