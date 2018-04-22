get '/' do
	@questions = Question.order("updated_at DESC")

 redirect "/signin"

end

get '/questions/new' do 
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	p @user
	if session[:scrambled_cookie] != nil
		erb :"/questions/new"
	else
		redirect "/users/signin"
	end
end 

post '/questions' do
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	@question = Question.create(title: params[:title],description: params[:description], user_id: @user.id)
	redirect "/questions/#{@question.id}"
end

get '/questions/:id' do 
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	@question = Question.find(params[:id])
	@answers = Answer.where(question_id: params[:id])
	erb :"/show"
end

get '/questions/:id/edit' do
	@question = Question.find(params[:id])
	erb :"/questions/edit"
end

post '/questions/:id/edit' do
	@question = Question.find(params[:id])
	@question.update(title: params[:title],description: params[:description])
	redirect "/questions/#{@question.id}"
end

get '/questions/:id/delete' do
	@question = Question.find(params[:id])
	@question.destroy
	redirect "/home"
end