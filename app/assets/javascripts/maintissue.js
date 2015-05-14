$(document).ready(function() {

$('.maint-issue-form form').on('submit', function(event){
    event.preventDefault();


    $('.maint-issue').css({"display":"none"});
    console.log(this);

    request = $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
    });
    request.done(function(data){
       console.log(data)

       var newFixOrder = $('.recent-reports-container ul li:first').clone()
       newFixOrder.appendTo('.recent-reports-container ul')
       newFixOrder.find('.created')
          .text(data.created_at).end()
          .find('.report_comment')
          .text(data.comment).end()


    });
  });


});




