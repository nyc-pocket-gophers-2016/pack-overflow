def current_user
  session[:user_id] ? User.find(session[:user_id]) : nil
end

def logged_in?
  !!current_user
end
