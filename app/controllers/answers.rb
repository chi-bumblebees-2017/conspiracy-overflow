post '/questions/:id/answers' do
  check_login
  @question = Question.find(params[:id])
  @answer = Answer.new(body: params[:body], responder_id: session[:user_id])
  if @question.answers << @answer
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :"questions/show"
  end
end
