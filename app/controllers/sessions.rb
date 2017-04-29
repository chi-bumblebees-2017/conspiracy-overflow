get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])

  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["The CIA is manipulating your data. Try again"]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect "/questions"
end
