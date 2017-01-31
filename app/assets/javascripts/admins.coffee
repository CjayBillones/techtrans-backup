$(document).ready ->
  $('#admin_user_tokens').tokenInput '/admins.json',
    crossDomain: false
    propertyToSearch: 'username'
    tokenValue: 'id'
    preventDuplicates: true
    theme: 'facebook'
  return