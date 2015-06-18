$(document).ready(function() {



 $('.search-form').on('submit', function(event){
    event.preventDefault();

    var $mymodal = $('#myModal');
    var $address = $('#search-address').val();
    var $zip = $('#search-zip-code').val();

    var search = $.ajax({
      url: '/searches',
      data: {address: $address, zip_code: $zip},
      type: 'post',
    });
    search.done(function(data){
      console.log(data);
      if (typeof data[0] === "string") {
        displayErrors(data);
      } else if (typeof data[0] === "object") {
        console.log(data.length);
        displayResults(data);
        $mymodal.modal('show');
      } else {
        window.location.href = "/buildings/new?address="+ $address +"&zipcode=" +$zip;
      }
    });
  });
   $('#modal-fail-btn').on('click', function(event){
      event.preventDefault;

      var $address = $('#search-address').val();
      var $zip = $('#search-zip-code').val();

      window.location.href = "/buildings/new?address="+ $address +"&zipcode=" +$zip;
   });


});

var displayResults = function(results) {
  $('.modal-body').html('<div class=\'results-modal\'></div>');
  for (var i = 0; i < results.length; i++) {
    $('.results-modal').first().clone().html('<p><a href=\'/buildings/' + results[i].id + '\'>' + results[i].address + '</a></p>').appendTo('.modal-body');

  }
};

var displayErrors = function(results) {
  for (var i = 0; i < results.length; i++) {
    $('.search-errors').html('<p>' + results[i] + '</p>');
  }
};
