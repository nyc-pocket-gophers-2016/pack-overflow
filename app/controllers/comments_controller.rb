
get '/questions/:id/comments/new' do
  # @question = Question.find(params[:id])
  if request.xhr?
    erb :'comments/_new_comment', layout: false
  else
    erb :'comments/new'
  end

end

post '/questions/:id/comments' do
	@question = Question.find_by(id: params[:id])
 	@comment = @question.comments.build(body: params[:body], user: current_user)
 		if @comments.save
 			erb :'comments/new'
 			# redirect "/questions/#{@question.id}"
 		else
 			@error = "Your comment in invalid."
    		 redirect :'/questions/:id/comments'
    	end
end

# put 'questions/:id/comments/:id'
# 	@question = Question.find_by(id: params[:id])
#  	@comment = question.comments.find(id: params[:id])
#  		if @comments.save
#  		erb :'comments/show'
#  		else
# end

delete 'questions/:id/comments/:id' do
	@question = Question.find_by(id: params[:id])
    @comment = Comment.find_by(params[:id])
	@comment.destroy
end


get '/answers/:id/comments/new' do
	@answer = Answer.find_by(id: params[:id])
	# @comment = @question.comments.build(body: params[:body], user: @question.user)
	erb :'/comments/new'
end

post '/answers/:id/comments' do

	@answer = Answer.find_by(id: params[:id])
 	@comment = @answer.comments.build(body: params[:body], user: current_user)
 		if @comment.save
 			# binding.pry
 		redirect :"/questions/#{@answer.question.id}"
 		else
 			@error = "Your comment in invalid."
    		erb :'/questions/:id/'
    	end
end

# put '/answer/:id/comments/:id'
# 	@answer = Answer.find_by(id: params[:id])
#  	@comment = answers.comments.find(id: params[:id])
#  		if @comments.save
#  		erb :'comments/show'
#  		else
# end

delete '/answers/:id/comments/:id' do
	@answer = Answer.find_by(id: params[:id])
    @comment = Comment.find_by(params[:id])
	@comment.destroy
end
