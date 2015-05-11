$(document).ready(function() {

$('.evict-notice-form').on('submit', function(event){
    event.preventDefault();
    debugger
    request = $.ajax({
      url: 'http://localhost:3000/eviction_notice',
      // url: $('form').attr('action')
      method: "post",
      data: $(this).serialize(),
      dataType: 'json'
    });
    request.done(function(data){
       console.log(data)
       data {option:     , comment } data.option
       $('.letter-dropdown').append()
       // where do we send this data?


    });
  });


});
