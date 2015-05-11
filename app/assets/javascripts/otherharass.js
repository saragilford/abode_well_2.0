$(document).ready(function() {

$('.harassment-form').on('submit', function(event){
    event.preventDefault();
    debugger
    request = $.ajax({
      url: 'http://localhost:3000/report',
      method: "post",
      data: $(this).serialize(),
      dataType: 'json'
    });
    request.done(function(data){
       console.log(data)
       // where do we send this data?


    });
  });


});




