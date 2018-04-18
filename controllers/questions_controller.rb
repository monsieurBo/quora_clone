get '/' do
	@questions = Question.order("updated_at DESC")

 erb :"/home"

end

get '/questions/new' do 
	erb :"/questions/new"
end 

post '/questions' do
	@question = Question.create(title: params[:title],question: params[:description])
	redirect "/questions/#{@question.id}"
end

get '/questions/:id' do 
	@question = Question.find(params[:id])
	p params[:id]
	@answers = Answer.where(question_id: params[:id])
	p @answers
	erb :"/show"
end

get '/questions/:id/edit' do
	@question = Question.find(params[:id])
	erb :"/questions/edit"
end

post '/questions/:id/edit' do
	@question = Question.find(params[:id])
	@question.update(title: params[:title],question: params[:description])
	redirect "/questions/#{@question.id}"
end

get '/questions/:id/delete' do
	@question = Question.find(params[:id])
	@question.destroy
	redirect "/"
end