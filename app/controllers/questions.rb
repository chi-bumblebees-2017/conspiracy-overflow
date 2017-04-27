get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  # TODO: check_login
  erb :'questions/new'
end

post '/questions' do
  # TODO: check_login
  question = Question.new(params[:question])
  # TODO: question.author = current_user
  question.author = User.first
  if question.save
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :"questions/new"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
