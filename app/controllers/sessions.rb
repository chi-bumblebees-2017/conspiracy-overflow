get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])

  if user
    session[:id] = user.id
    redirect "/questions"
  else
    @errors = ["The CIA manipulating your data. Try again"]
    # @errors = new_user.errors.full_messages
    erb :'sessions/new'
  end
end

delete '/session/:id' do
  session[:id] = nil
  redirect "/questions"
end