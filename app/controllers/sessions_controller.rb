get '/login' do
  if logged_in?
    redirect('/')
  else
    erb(:'sessions/new')
  end
end

post '/login' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password"]
    erb :'users/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
