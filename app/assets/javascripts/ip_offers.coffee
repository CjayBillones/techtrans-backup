# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#ip_offer_tag_list').tokenInput '/tags.json',
    crossDomain: false
    tokenValue: 'name'
    preventDuplicate: true
    allowFreeTagging: true
    onFreeTaggingAdd: true
    prePopulate: $('#ip_offer_tag_list').data('pre')
    theme: 'facebook'
  return