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
      } else if (data.length > 0) {
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
  for (var i = 0; i < results.length; i++) {
    $('.results-modal').html('<p>' + results[i].address + '</p>');
  }
};

var displayErrors = function(results) {
  for (var i = 0; i < results.length; i++) {
    $('.search-errors').html('<p>' + results[i] + '</p>');
  }
};
