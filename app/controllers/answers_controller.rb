get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/new'
end

post '/questions/:id/answers' do 
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(body: params[:body], question_id: @question.id, user: @question.user)
  # binding.pry
  
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @error = "You provided an invalid answer. Please try again."
    redirect :"/questions/#{@question.id}"

  end
end

#edit answer
get '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:answer_id])
  if current_user && current_user == @answer.user
    erb :"answers/_edit_answer_partial"
  end
end

put '/questions/:question_id/answers/:answer_id' do 
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:answer_id])
  @answer.assign_attributes(params[:answer])  
  @answer.save #should there be an xhr request?
    redirect "/questions/#{@question.id}"
  # else
  #   # erb :'/questions/edit'
  # end
end

#delete answer
delete '/questions/:question_id/answers/:answer_id' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(params[:answer_id])
  if request.xhr?
    @answer.destroy
  else
    @answer.destroy
    redirect "/questions/#{@question.id}"
  end
end