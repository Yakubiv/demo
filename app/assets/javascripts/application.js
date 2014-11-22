// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//= require ckeditor-jquery
//= require ckeditor/config
//= require jquery
//= require jquery_ujs  
//= require_tree .



$(function() {
  $('#make-favorite').click(function() {
    $button = $(this)
    if ( $( "#make-favorite" ).hasClass( "unfavorite" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-user-email') + '/favorites/' + $button.attr('data-post-id'),
        success: function() {
          $button.removeClass('unfavorite').addClass('favorite').html("<span> Добавлено в избранное</span>"); ; 
        }
      })
    } else {
      $.ajax({
        type: "DELETE",
        url: '/' + $button.attr('data-user-email') + '/favorites/' + $button.attr('data-post-id'),
        success: function() {
          $button.removeClass('favorite').addClass('unfavorite').html("<span> В избранное!</span>"); 
        }
      })
    }
  });
});