$(document).ready(function() {

 $('#report-button').on('click', function(event){
    event.preventDefault();

    $('.report-container').css("display", "initial");

    $.ajax({
    url: 'http://localhost:3000',
    dataType: 'json'
    }).done(function(data){

    })
  });

 $("#report-form-dropdown").change(function(){
  $(".form-contents").children().css({"display":"none"});
  $("." + $(this).val()).css({"display":"initial"});
 });

});