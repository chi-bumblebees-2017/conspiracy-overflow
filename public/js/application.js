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
      $('#answer-guts').append(response);
      $('.answer-form').trigger('reset');
    });
  });
////////////ENDS NEW ANSWER AJAX////////////
});
