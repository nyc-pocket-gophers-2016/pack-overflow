post '/questions/:id/answers' do 
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(body: params[:body])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @error = "You provided an invalid answer. Please try again."
    erb :'/questions/#{@question.id}'
  end
end

#edit answer
put 'questions/:id/answers/:id' do 
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:id])
  @answer.assign_attributes(params[:answer])  
  if @answer.save #should there be an xhr request?
    redirect :'/questions/#{@question.id}'
  else
    # erb :'/questions/edit'
  end
end

#delete answer
delete 'questions/:id/answers/:id' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(params[:id])
  if request.xhr?
    @answer.destroy
  else
    @answer.destroy
    redirect "/questions/#{@question.id}"
  end
end