def current_user
  if session[:scrambled_cookie]
    @user ||= User.find_by(scrambled_cookies: session[:scrambled_cookie])
  end
end

def logged_in?
	if session[:scrambled_cookie]
		return true
	else 
		return false
	end
end

def has_voted?
	if @user.id
		return true
	else
		return false
	end
end

