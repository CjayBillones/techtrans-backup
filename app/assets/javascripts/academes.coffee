$(document).ready ->
  $('#academe_user_tokens').tokenInput '/academes.json',
    crossDomain: false
    propertyToSearch: 'username'
    tokenValue: 'id'
    preventDuplicates: true
    theme: 'facebook'
  return