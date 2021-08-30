targetScope = 'subscription'

param budgetName string

@allowed([
  'Annually'
  'BillingAnnual'
  'BillingMonth'
  'BillingQuarter'
  'Monthly'
  'Quarterly'  
])
param timeGrain string
param contactEmails array
param contactRoles array
param contactGroups array
param amount int
param startDate string
param endDate string

var firstThreshold = 90
var secondThreshold = 110

resource Budget 'Microsoft.Consumption/budgets@2019-10-01' = {
  name: budgetName
  properties: {
    amount: amount
    category: 'Cost'
    notifications: {
      NotificationForExceededBudget1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: firstThreshold
        contactEmails: contactEmails
        contactRoles: contactRoles
        contactGroups: contactGroups
      }
      NotificationForExceededBudget2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: secondThreshold
        contactEmails: contactEmails
        contactRoles: contactRoles
        contactGroups: contactGroups
      }
    }
    timeGrain: timeGrain
    timePeriod: {
      endDate: endDate
      startDate: startDate
    }
  }
}


output budget string = Budget.name
