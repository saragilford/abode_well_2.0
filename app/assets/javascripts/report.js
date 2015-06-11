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

      var countRequest = $.ajax ({
        url : "http://localhost:3000/buildings/" + data.building_id + "/complaint_count",
        type: 'get',
        dataType: 'json',
      });
      countRequest.done(function(response){
        $('#evic-count').text(response.evic)
        $('#fix-count').text(response.fix_order)
        $('#harass-count').text(response.harass)
        $('#rent-count').text(response.rent)
      });


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

