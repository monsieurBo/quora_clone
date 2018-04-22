get '/home' do 
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	if @user
		@questions = Question.order("updated_at DESC")
		erb :"/users/home"
	else
		redirect '/signin'
	end
end

get '/signout' do 
	session.clear
	redirect "/"
end

get '/signin' do
	erb :"/sessions/signin"
end

post '/signin' do
	# byebug
	@user = User.find_by(email: params[:email])
	if @user && @user.authenticate(params[:password])
	# if @user
		session[:scrambled_cookie] = @user.scrambled_cookies
		redirect '/home'
	else
		@message = "email/password incorrect. Please try again."
		redirect back
	end 
end

get '/signup' do
	erb :"/registration/signup"
end

post '/signup' do
	@cookie = SecureRandom.hex(10)
	@user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], scrambled_cookie: @cookie)
	if @user.save
		session[:scrambled_cookie] = @user.scrambled_cookies
		redirect '/home'
	else
		@message = "invalid info. Please try again."
		redirect '/signup'
	end
end