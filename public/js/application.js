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
    });
  });
///////////////// END COMMENT AJAX ///////////////////////////////
});
