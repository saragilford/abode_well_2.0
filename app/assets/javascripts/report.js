$(document).ready(function() {

$('.report-form').on('submit', function(event){
    event.preventDefault();

    $('body').animate({
         scrollTop: $('.big-mama-nav').offset().top
           }, 2000);
    // $('.report-container').css({"display":"none"});

    request = $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
    });
    request.done(function(data){

       var newReport = $('.recent-reports-comments div').first().clone()
       newReport.prependTo('.recent-reports-comments');
       newReport.find('.created')
          .text(data.created_at).end()
          .find('.report_comment')
          .text(data.comment).end()


      var scoreRequest = $.ajax({
        url: "http://localhost:3000/buildings/" + data.building_id + "/score",
        type: 'get',
        dataType: 'json',
      });
      scoreRequest.done(function(data){
        $('#score-badge').text(data.score)
      });


    });




  });




});

