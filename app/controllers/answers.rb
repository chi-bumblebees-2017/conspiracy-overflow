post '/questions/:id/answers' do
  check_login
  @question = Question.find(params[:id])
  @answer = Answer.new(body: params[:body], responder_id: session[:user_id])

  if @question.answers << @answer
    if request.xhr?
      erb :_answer_guts, layout: false
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      @errors = @answer.errors.full_messages
      erb :'_errors', layout: false
    else
      @errors = @answer.errors.full_messages
      erb :"questions/show"
    end
  end
end

put '/questions/:question_id/answers/:id' do
  check_login
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])

  if user_is_author?(@question.author)
    @question.clear_favorites
    @answer.set_favorited
  end
  redirect "/questions/#{@question.id}"
end
