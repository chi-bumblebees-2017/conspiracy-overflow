get '/users/new' do
  erb :'users/new'
end

post '/users' do
  new_user = User.new(params[:user])
  new_user.password = params[:password]

  if new_user.save
    session[:id] = new_user.id
    redirect "/questions"
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end
end
