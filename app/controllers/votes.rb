post "/votes" do
  check_login

  # Circle back on this logic:
  votable = Vote.new(params[:vote]).votable

  if params[:submit] == "Upvote"
    votable.upvote_from(current_user)
  else
    votable.downvote_from(current_user)
  end

  if request.xhr?
  	votable.total_vote_value.to_s
  else
  	redirect "/questions/#{params[:question_id]}"
  end
end
