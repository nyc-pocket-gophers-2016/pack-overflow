post 'questions/:id/tags' do
	@question = Question.find_by(id:params[:id])
	binding.pry
	@tags = params[:tags]
	@tags.split(",").each do |tag|
		Tag.create(name: tag)
		QuestionTag.create(tag: tag, question: @question)
	end
end

get '/tags/:id' do
	@tag = Tag.find(params[:id]) 
	erb :'tags/show'
end