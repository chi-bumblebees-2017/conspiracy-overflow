get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

# For testing
get '/questions/new' do
  erb :"questions/new"
end

# For testing
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"questions/show"
end
