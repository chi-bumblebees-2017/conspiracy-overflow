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
    }).fail(function(status) {
      if (status === 422) {
        alert("error: answer body cannot be blank.") }
      else {
        alert("error: you must be logged in to answer.");
        window.location.href = "/sessions/new"
      }
    });
  });
////////////ENDS NEW ANSWER AJAX////////////

/////////////// NEW COMMENT AJAX START//////////////////

  $(".new-comment-form").on("submit", function( event ) {
    event.preventDefault();
    var action = $(this).attr("action");
    var method = $(this).attr("method");
    var data = $(this).serialize();
    var that = $(this)

    $.ajax({
      method: method,
      url: action,
      data: data,
    })
    .done(function( response ) {
      $(that).closest(".comments-container").find(".comments-table").append(response);
      $(".new-comment-form").trigger('reset');
    })
    .fail(function(request, status, error) {
      if (request.status === 422) {
        alert("Error: comment text can't be blank");
      } elsif (request.status === 401) {
        alert("You must be logged in to comment");
        window.location.href = "/sessions/new"
      };
    });
  });
///////////////// END COMMENT AJAX ///////////////////////////////

////////////AJAX FOR BEST ANSWER////////////
  $('#answer-guts').on('submit', '.favorite-form', function(event) {
    event.preventDefault();

    var $form = $(this);
    var action = $(this).attr('action');

    $.ajax({
      method: "put",
      url: action
    })
    .done(function(response) {
      $('.alien-image').html('');
      $form.closest('tr').find('.alien-image').html("<img class='best-indicator' src='/images/alien.png'>");
    });
  })
  ///////////END BEST ANSWER////////////
});
