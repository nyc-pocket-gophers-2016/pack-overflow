get '/login' do
  logged_in? ? redirect('/') : erb(:'sessions/new')
end

post '/login' do
  user = User.find_by(email: params[:email])
end
