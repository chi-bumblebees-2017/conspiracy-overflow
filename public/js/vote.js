$(document).ready(function() {
	/*This part is fun. Buckle up:
		Ends up, it's really hard to get a value from a form's submit button. Except we need it because our votes are one form with two submits.

		So basically, every time someone clicks up or downvote on something, this below bit fires.

		Its job is to tag the thing that fired as "just-clicked". But first it removes "just-clicked" from anything else - that way vote-happy users can vote to their heart's content.

		It won't work if someone submits the form by not clicking (key press) but like, ¯\_(ツ)_/¯ There's not a less-hacky version without rewriting our vote functionality.
	*/
	$(".container").on("click", ".vote-button", function(event){
		$("#just-clicked").removeAttr("id");
		$(this).attr("id", "just-clicked");
	});
	//FORM SUBMISSION HANDLING:
	$(".container").on("submit", ".vote-form", function(event) {
		event.preventDefault();

		var vote = $(this).serialize();
		var submitValue = $("#just-clicked").val();

		var $voteForm = $(this);

		$.ajax({
			method: "POST",
			url: "/votes",
			data: vote + "&submit=" + submitValue
		})
		.done(function(data){
			$voteForm.find(".total-value").text(data);

			cleanClickForm($voteForm)
			toggleClickButton($voteForm.find("#just-clicked"));
		})
		.fail(function(request, status, error) {
			alert("Error: You must be logged in to vote, sheep.")
      window.location.href = "/sessions/new"
		});
	});
});

function toggleClickButton($justClicked){
	$justClicked.closest("fieldset").prop("disabled", true);
	if ( $justClicked.hasClass("upvote") ) {
		$justClicked.closest("fieldset").toggleClass("upvoted");
	} else {
		$justClicked.closest("fieldset").toggleClass("downvoted");
	}
}

function cleanClickForm($voteForm){
	var $voteButtons = $voteForm.find(".vote-button");
	var $fieldset = $voteButtons.closest("fieldset")
	$fieldset.removeClass("downvoted upvoted");
	$fieldset.prop("disabled", false)
}
