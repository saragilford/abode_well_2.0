$(document).ready(function() {

$('.lease-increase-form form').on('submit', function(event){
    event.preventDefault();


    $('.lease-increase-form').css({"display":"none"});
    console.log(this);

    request = $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
    });
    request.done(function(data){
       console.log(data)

       var newRent = $('.recent-reports-container ul li:first').clone()
       newRent.appendTo('.recent-reports-container ul')
       newRent.find('.created')
          .text(data.created_at).end()
          .find('.report_comment')
          .text(data.comment).end()


    });
  });


});






