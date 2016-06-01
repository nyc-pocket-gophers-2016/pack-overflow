get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.build(username: params[:username], email: params[:email], password: params[:password])

  @user.save ? redirect('/') : erb(:'users/new')
end

get '/users/:id' do
  user = User.find_by(id: params[:id])

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
