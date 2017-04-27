get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  # find user
  #set session
  # errors?
  redirect "/questions"
end

delete '/session/:id' do
  #find user session
  #destroy session
  redirect "/questions"
end
