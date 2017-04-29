get '/users/new' do
  erb :'users/new'
end

post '/users' do
  new_user = User.new(params[:user])
  new_user.password = params[:password]

  if new_user.save
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  check_login

  if current_user == User.find(params[:id])
    @asked_questions = current_user.questions
    @answered_questions = current_user.answers.map(&:question).uniq
    @commented_questions = current_user.comments.where(commentable_type: "Question").map(&:commentable)
    @commented_questions = @commented_questions.uniq
    @voted_questions = current_user.votes.where(votable_type: "Question").map(&:votable)
    @voted_questions = @voted_questions.uniq
    erb :"users/show"
  else
    redirect "/"
  end
end
