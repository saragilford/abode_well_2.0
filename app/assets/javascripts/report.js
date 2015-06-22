$(document).ready(function() {
// initialize function comes from  _building_map.html.erb and loads map
  initialize();
  var cloneComment = $('.recent-reports-comments div').first().detach();

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
      console.log(data);

       var newReport = cloneComment.clone();

       if (data.class=="Harassment Report") {
        newReport.find('.type-of-comment')
        .text("Landlord Harassment")
      } else if (data.class=="Eviction Notice") {
        newReport.find('.type-of-comment')
        .text("Eviction Notice");
      } else if (data.class=="Rent Increase") {
        newReport.find('.type-of-comment')
        .text("Rent Increase");
      } else if (data.class=="Maintenance Issue") {
        newReport.find('.type-of-comment')
        .text("Maintenance Issue");
      }

       newReport.find('.report_comment')
          .text(data.comment).end();
          // find('.created')
          // .text(data.created_at).end();
       newReport.prependTo('.recent-reports-comments');

      var countRequest = $.ajax ({
        url : "/buildings/" + data.building_id + "/complaint_count",
        type: 'get',
        dataType: 'json',
      });
      countRequest.done(function(response){
        $('#evic-count').text(response.evic);
        $('#fix-count').text(response.fix_order);
        $('#harass-count').text(response.harass);
        $('#rent-count').text(response.rent);
      });


      var scoreRequest = $.ajax({
        url: "/buildings/" + data.building_id + "/score",
        type: 'get',
        dataType: 'json',
      });
      scoreRequest.done(function(data){
        $('#score-badge').text(data.score);
      });


    });




  });




});

