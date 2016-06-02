post '/questions/:id/comments'
	@question = Question.find_by(id: params[:id])
 	@comment = Comment.new(body: params[:body])
 		if @comments.save
 		erb :'comments/new'
 		else 
end

put 'questions/:id/comments/:id'
	@question = Question.find_by(id: params[:id])
 	@comment = Comment.new(body: params[:body])
 		if @comments.save
 		erb :'comments/show'
 		else 
end

delete 'questions/:id/comments/:id'
  Comment.find_by(id: current_user.id).destroy
end

post '/answer/:id/comments'
	@answer = Answer.find_by(id: params[:id])
 	@comment = Comment.new(body: params[:body])
 		if @comments.save
 		erb :'comments/new'
 		else 
end

put '/answer/:id/comments/:id'
	@answer = Answer.find_by(id: params[:id])
 	@comment = Comment.new(body: params[:body])
 		if @comments.save
 		erb :'comments/show'
 		else 
end

delete '/answer/:id/comments/:id'
	Comment.find_by(id: current_user.id).destroy
end