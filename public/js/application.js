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

  $(".question-show-container").on("submit", ".new-comment-form", function( event ) {
    event.preventDefault();

    var action = $(this).attr("action");
    var method = $(this).attr("method");
    var data = $(this).serialize();
    var that = $(this)

    $(this).addClass('hidden');
    $(this).find(".comment-body").removeClass('revealed-textarea');
    $(this).prev().removeClass('hidden');


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
      } else {
        alert("You must be logged in to comment");
        window.location.href = "/sessions/new"
      };
    });
  });
///////////////// END COMMENT AJAX ///////////////////////////////

//////////////////// START DYNAMIC COMMENT LINK DISPLAY AJAX ///////////////////////

  $(".display-comment-form").on("click", function( event ) {
    event.preventDefault();
    $(this).addClass('hidden');
    var form = $(this).next();
    form.removeClass('hidden');
    form.find(".comment-body").addClass('revealed-textarea');

  });

////////////////// END DYNAMIC COMMENT LINK DISPLAY AJAX ///////////////////////////////////

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
