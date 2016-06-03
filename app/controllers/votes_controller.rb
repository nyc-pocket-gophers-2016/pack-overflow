post '/questions/:id/votes' do
	# binding.pry
	@question = Question.find_by(id: params[:id])
 	@vote = @question.votes.build(value: params[:value], user: current_user)
 	@vote.save
 			#erb :'comment/new'
 	redirect :"/questions/#{@question.id}"
end
