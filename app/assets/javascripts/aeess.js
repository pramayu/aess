$(document).ready(function(){
  //carousel
  $('.carousel').carousel({
    interval: 200000
  });

  //scroll
  jQuery("html").niceScroll({cursorcolor:"#c0bfbf"});


  //navbar
  $('#mnu_bar').on('click', function(){
    $(this).toggleClass('has_nav_open');
    $('.nav_slide').toggleClass('has_nav_open');
  })
});
