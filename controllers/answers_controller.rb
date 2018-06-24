get '/' do
	@answers = Question.order("updated_at DESC")

 erb :"home"

end

get '/answer' do
	erb :"/answers/answer"
end

post '/answers/:id' do
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	@question = Question.find(params[:id])
	if params[:anonymous] != nil
		@answer = Answer.create(answer: params[:answer],username: params[:anonymous], question_id: params[:id], user_id: @user.id)
	else
		@answer = Answer.create(answer: params[:answer],username: params[:username], question_id: params[:id], user_id: @user.id)
	end
	redirect "/questions/#{@question.id}"
end

get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :"/answers/edit"
end

post '/answers/:id/edit' do
	@answer = Answer.find_by(id: params[:id])
	@answer.update(username: params[:username],answer: params[:answer])
	redirect "/questions/#{@answer.question.id}"
end

get '/answers/:id/delete' do
	@answer = Answer.find(params[:id])
	@answer.destroy
	redirect "/questions/#{@answer.question.id}"
end

get '/answers/:id/up' do
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	@votes = Vote.find_by(answer_id: params[:id], user_id: @user.id)
	 if @votes != nil
		@vote = Vote.find_by(user_id: @user.id)
		@vote.update(updown: true)
	else
		Vote.create(answer_id: params[:id], user_id: @user.id, updown: true)
	end
  redirect "/questions/#{Answer.find(params[:id]).question.id}"
end

get '/answers/:id/down' do
	@user = User.find_by(scrambled_cookies: session[:scrambled_cookie])
	@votes = Vote.find_by(answer_id: params[:id], user_id: @user.id)
	if @votes != nil
		@vote = Vote.find_by(user_id: @user.id)
		@vote.update(updown: false)
	else
		Vote.create(answer_id: params[:id], user_id: @user.id, updown: false)
	end
  redirect "/questions/#{Answer.find(params[:id]).question.id}"
end
