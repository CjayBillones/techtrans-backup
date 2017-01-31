$(document).on 'turbolinks:load', ->
  $('#academe_user_tokens').tokenInput '/academes.json',
    crossDomain: false
    tokenValue: 'username'
    preventDuplicate: true
    theme: 'facebook'
  return