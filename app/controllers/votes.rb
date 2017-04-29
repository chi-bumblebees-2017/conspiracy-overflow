post "/votes" do
  # check_login

  # Circle back on this logic:
  votable = Vote.new(params[:vote]).votable

  if logged_in?
    if params[:submit] == "Upvote"
      success = votable.upvote_from(current_user)
    else
      success = votable.downvote_from(current_user)
    end

    if request.xhr?
      # logged in, ajax
    	votable.total_vote_value.to_s
    else
      # logged in, no ajax
    	redirect "/questions/#{params[:question_id]}"
    end
  else
    if request.xhr?
      # not logged in, ajax
      status 401
    else
      # not logged in, no ajax
      status 401
      redirect "/sessions/new"
    end
  end
end
