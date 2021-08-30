targetScope = 'subscription'

var contactRoles = [
  'Contributor'
  'Reader'
]

var contactEmails = [
  'rbhadti@gmail.com'
]

module freeTierBudget '../modules/bicep/Budget.bicep' = {
  name: 'FreeTierBudget'
  params: {
    budgetName: 'freetierbudget'
    timeGrain: 'Monthly'
    contactEmails: contactEmails
    contactRoles: contactRoles
    contactGroups: []
    amount: 2
    startDate: '2021-09-01'
    endDate: '2021-12-01'
  }
}
