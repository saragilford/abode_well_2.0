//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

 $('#report-button').on('click', function(event){
    event.preventDefault();

    $('.report-container').css("visibility", "visible");

    $.ajax({
    url: 'http://localhost:3000',
    dataType: 'json'
    }).done(function(data){

    })
  });

 $("#report-form-dropdown").change(function(){
  $("." + $(this).val()).css({"visibility":"visible"});
 });

});

