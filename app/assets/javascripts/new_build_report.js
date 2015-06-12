$(document).ready(function() {

  $('#new-build-rprt').on('click', function(event){
    event.preventDefault();

    $('.report-container').css("display", "initial");

        $('body').animate({
             scrollTop: $('.report-container').offset().top
               }, 2000);
  });

});