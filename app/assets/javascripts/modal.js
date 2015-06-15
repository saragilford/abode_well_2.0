$(document).ready(function() {


 $('.search-form').on('submit', function(event){
  // if address does not exist redirect rails path
  window.location.href = '/new_building_path';
  } else {
  else event.preventDefault();
 }




    var $mymodal = $('#myModal');

    $mymodal.css("display");

    request =$.ajax({
     url: 'http://localhost:3000/buildings/search'
     dataType: 'json'
    });
    request.done(function(data){
      console.log(data);
      $mymodal.find('.results-modal'), function(data){
         $('.results-modal').html('<p><a href=\'buildings/' + data.id +'>' data.address + ', ' + 'San Francisco, ' + data.zip +'</a><p>');
      }

    })
  });


});

