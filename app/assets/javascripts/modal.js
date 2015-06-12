$(document).ready(function() {

 $('.search-form').on('submit', function(event){
    event.preventDefault();
    var $mymodal = $('#myModal');

    $mymodal.css("display");


    request =$.ajax({
     url: 'http://localhost:3000/buildings/search'
     dataType: 'json'
    });
    request.done(function(data){
      console.log(data);
      $mymodal.find(), function(data){
         $mymodal.find('.modal-body').html(data);
      }

    })
  });


});

