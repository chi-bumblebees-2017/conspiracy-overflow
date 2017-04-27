get '/questions/new' do
  # TODO: check_login
  erb :'questions/new'
end


post '/questions' do
  # TODO: check_login


end

get '/questions/:id' do
  @question = Question.find(params[:id])

  erb :'questions/show'
end
