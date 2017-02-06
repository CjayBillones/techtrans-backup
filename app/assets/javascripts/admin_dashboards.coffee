# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#all-users-data-table, #approved-users-data-table, #pending-activation-users-data-table, #pending-approval-users-data-table, #deactivated-users-data-table, #rejected-users-data-table, #all-admin-users-data-table, #active-admin-users-data-table, #deactivated-admin-users-data-table, #all-academe-users-data-table, #approved-academe-users-data-table, #pending-approval-academe-users-data-table, #pending-activation-academe-users-data-table, #deactivated-academe-users-data-table, #rejected-academe-users-data-table, #all-industry-users-data-table, #approved-industry-users-data-table, #pending-approval-industry-users-data-table, #pending-activation-industry-users-data-table, #deactivated-industry-users-data-table, #rejected-industry-users-data-table, #all-ips-data-table, #approved-ips-data-table, #pending-ips-data-table, #offers-data-table, #accepted-offers-data-table, #pending-offers-data-table, #needs-data-table, #accepted-needs-data-table, #pending-needs-data-table').DataTable()
  return

$(document).ready ->
  $('#all-articles-data-table').dataTable 'columnDefs': [
    {
      'width': '5px'
      'targets': 0
    }
    {
      'width': '40px'
      'targets': 1
    }
    {
      'width': '100px'
      'targets': 2
    }
    {
      'width': '70px'
      'targets': 3
    }
    {
      'width': '70px'
      'targets': 4
    }
    {
      'width': '70px'
      'targets': 5
    }
  ]
  return