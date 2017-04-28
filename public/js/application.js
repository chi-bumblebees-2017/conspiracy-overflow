$(document).ready(function() {
  ///////////AJAX FOR NEW ANSWER/////////////
  $('.answer-form').on('submit', function(event) {
    event.preventDefault();

    var method = $(this).attr('method');
    var action = $(this).attr('action');
    var data = $(this).serialize();

    $.ajax({
      method: method,
      url: action,
      data: data,
    })
    .done(function(response) {
      console.log(response);
    })
    // .fail(function() {
    //   console.log("error");
    // })
    // .always(function() {
    //   console.log("complete");
    // });

  });
////////////ENDS NEW ANSWER AJAX////////////
});
