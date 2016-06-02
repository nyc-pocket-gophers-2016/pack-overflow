get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.create(username: params[:username], email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])

  erb :'users/show'
end

get '/users/:id/edit' do
  erb :'users/edit'
end

put '/users/:id' do
  current_user.assign_attributes(params[:user])

  current_user.save ? redirect("/users/#{user.id}/edit") : erb(:'users/edit')
end

delete '/users/:id' do
  User.find_by(id: current_user.id).destroy
end
