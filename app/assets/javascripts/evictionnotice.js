$(document).ready(function() {

$('.evict-notice-form form').on('submit', function(event){
    event.preventDefault();


    $('.evict-notice-form').css({"visibility":"hidden"});
    console.log(this);

    request = $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
    });
    request.done(function(data){
       console.log(data)

       var newEvict = $('.recent-reports-container ul li:first').clone()
       newEvict.appendTo('.recent-reports-container ul')
       newEvict.find('.created')
          .text(data.created_at).end()
          .find('.report_comment')
          .text(data.comment).end()


    });
  });


});

