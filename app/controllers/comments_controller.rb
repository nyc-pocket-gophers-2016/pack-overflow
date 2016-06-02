post '/questions/:id/comments'
	@question = Question.find_by(id: params[:id])
 	@comment = @question.comments.build(body: params[:body], user: current_user)
 		if @comments.save
 			redirect "/questions/#{@question.id}"
 		else
 			@error = "Your comment in invalid."
    		erb :'/questions/#{@question.id}'
end

# put 'questions/:id/comments/:id'
# 	@question = Question.find_by(id: params[:id])
#  	@comment = question.comments.find(id: params[:id])
#  		if @comments.save
#  		erb :'comments/show'
#  		else
# end

delete 'questions/:id/comments/:id'
	@question = Question.find_by(id: params[:id])
    @comment = Comment.find_by(params[:id])
	@comment.destroy
end

post '/answer/:id/comments'
	@answer = Answer.find_by(id: params[:id])
 	@comment = @answer.comments.build(body: params[:body], users: current_user)
 		if @comments.save
 		redirect "/answers/#{@answers.id}"
 		else
 			@error = "Your comment in invalid."
    		erb :'/answers/#{@answer.id}'
end

# put '/answer/:id/comments/:id'
# 	@answer = Answer.find_by(id: params[:id])
#  	@comment = answers.comments.find(id: params[:id])
#  		if @comments.save
#  		erb :'comments/show'
#  		else
# end

delete '/answer/:id/comments/:id'
	@answer = Answer.find_by(id: params[:id])
    @comment = Comment.find_by(params[:id])
	@comment.destroy
end
