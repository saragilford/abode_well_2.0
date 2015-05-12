$(document).ready(function() {

$('.harassment-form form').on('submit', function(event){
    event.preventDefault();


    $('.harassment-form').css({"visibility":"hidden"});
    console.log(this);

    request = $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
    });
    request.done(function(data){
       console.log(data)

       var newHarass = $('.recent-reports-container ul li:first').clone()
       newHarass.appendTo('.recent-reports-container ul')
       newHarass.find('.created')
          .text(data.created_at).end()
          .find('.report_comment')
          .text(data.comment).end()


    });
  });


});




