get '/users/new' do
  erb :'users/new'
end

post '/users' do
  #create User
  #set session
  #errors?
  redirect "/questions"
end
