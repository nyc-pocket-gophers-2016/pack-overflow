post '/questions/:id/votes' do
	@question = Question.find_by(id: params[:id])
 	@vote = @question.votes.build(value: params[:value], user: current_user)
 		if @vote.save
 			#erb :'comment/new'
 			erb :"/questions/#{@question.id}"
 		else

    	erb :'/questions/#{@question.id}'
    end
end
