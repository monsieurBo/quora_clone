

get '/' do
	@answers = Question.order("updated_at DESC")

 erb :"home"

end

get '/answers/:id/answer' do 
	@question = Question.find(params[:id])
	erb :"/answers/answer"
end 

post '/answers/:id' do
	@question = Question.find(params[:id])
	@answer = Answer.create(answer: params[:answer],username: params[:username], question_id: params[:id], votes: 0)
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
	@votes = Vote.create(answer_id: params[:id])
	@answer = Answer.find(params[:id])
	redirect "/questions/#{@answer.question.id}"
end