# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#all-users-data-table, #approved-users-data-table, #pending-activation-users-data-table, #pending-approval-users-data-table, #deactivated-users-data-table, #rejected-users-data-table, #all-admin-users-data-table, #active-admin-users-data-table, #deactivated-admin-users-data-table, #all-ips-data-table, #approved-ips-data-table, #pending-ips-data-table, #offers-data-table, #accepted-offers-data-table, #pending-offers-data-table, #needs-data-table, #accepted-needs-data-table, #pending-needs-data-table').DataTable()
  return