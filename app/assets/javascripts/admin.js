//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.easing.1.3.js
//= require jquery.validate.js
$(document).ready(function(){
	$('.alert').delay(2000).fadeOut("slow");
	$('#close_alt').on("click", function(){
		$('.alert').fadeOut("fast", function(){
			$('alert').remove();
		});
	});
});