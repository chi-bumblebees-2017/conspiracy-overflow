# Verify a user is logged in before letting them comment
before "/comments" do
  check_login
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  @comment.commenter_id = current_user.id
  @question = Question.find(params[:question][:question_id])

  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :"questions/show"
end

end
