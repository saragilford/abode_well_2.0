$(document).ready(function() {

 $('#report-button').on('click', function(event){
    event.preventDefault();

    $('.report-container').css("display", "initial");

    $('body').animate({
         scrollTop: $('.report-container').offset().top
           }, 2000);


  });

 // $("#report-form-dropdown").change(function(){
 //  $(".form-contents").children().css({"display":"none"});
 //  $("." + $(this).val()).css({"display":"initial"});
 // });



});