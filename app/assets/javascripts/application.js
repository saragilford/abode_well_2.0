$(document).ready(function() {

 $('#report-button').on('click', function(event){
    event.preventDefault();

    $('.report-container').css("visibility", "visible");

    $.ajax({
    url: 'http://localhost:3000',
    dataType: 'json'
    }).done(function(data){
      console.log(data[0].address);
      console.log (data[1].neighborhood);
      console.log(data[2].zip_code);
    })
  });

 $("#report-form-dropdown").change(function(){
  $("." + $(this).val()).css({"visibility":"visible"});
 });

});

