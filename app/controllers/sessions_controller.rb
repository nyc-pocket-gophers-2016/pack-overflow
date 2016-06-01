get '/login' do
  logged_in? ? redirect('/') : erb(:'sessions/new')
end

post '/login' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password"]
    erb :'users/new'
  end
end

delete '/logout' do
  session[current_user.id].destroy
  redirect '/'
end
