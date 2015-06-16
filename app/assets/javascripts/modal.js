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
      console.log(data[0]);
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

});

var displayResults = function(results) {
  $('.results-modal').clone().html('<p class=\'result-link\'><a href=\'/buildings/' + results[0].id + '\'>' + results[0].address + '</a></p>').appendTo('.modal-body');
  for (var i = 1; i < results.length; i++) {
    $('.result-link').clone().html('<p><a href=\'/buildings/' + results[i].id + '\'>' + results[i].address + '</a></p>').appendTo('.modal-body');

  }
};

var displayErrors = function(results) {
  for (var i = 0; i < results.length; i++) {
    $('.search-errors').html('<p>' + results[i] + '</p>');
  }
};
