// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require jquery.turbolinks
//= require jquery_ujs
// require turbolinks
//= require local_time
//= require select2-full
//= require bootstrap-datepicker
//= require social-share-button
//= require jquery.tokeninput
//= require ckeditor/init
//= require jquery.dataTables.min
//= require dataTables.semanticui.min
//= require semantic.min
//= require slick.min
//= require_tree .

$(document).ready(function(){
  $('#academe_birthday .input-group.date').datepicker({
    startView: 'years',
    autoclose: true
  });
});

$(document).ready(function() {
  $("#industry_classification, #industry_country_code, #academe_user_type, #ip_need_privacy_option, #ip_offer_patent_status").select2();
});

$(document).ready(function(){
    $('.js-slick').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    dots: true,
    draggable: false,
    fade: true,
    speed: 1000
  });
});
