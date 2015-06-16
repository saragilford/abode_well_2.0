$(document).ready(function() {

 $('.search-form').on('submit', function(event){
    event.preventDefault();

    search = $.ajax({
      url: '/buildings/results'
    });
      search.done(function(data,status))
      if e.status == 200
        if e.status==404


    request =$.ajax({
     url: '/buildings/results',
     dataType: 'json'
    });
    request.done(function(data,status){
      console.log(data);
      console.log(status);
      // $mymodal.find(), function(data){
      //    $mymodal.find('.modal-body').html(data);
      // }

    })
  });


});

