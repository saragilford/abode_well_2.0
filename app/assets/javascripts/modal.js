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
    search.done(function(data,status){
      if (status === "success") {
        console.log(data.length);
        displayResults(data);
        $mymodal.modal('show');
      } else {
        window.location.href = "/buildings/new";
      }
    });
});

});

var displayResults = function(results) {
  for (var i = 0; i < results.length; i++) {
    $('.results-modal').html('<p>' + results[i].address + '</p>');
  }
};
