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


#editing answer
put 'questions/:id/answers/:id' do 
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:id])
  #logic to edit answer using partial form
end


#delete answer
delete 'questions/:id/answers/:id' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(params[:id])

  redirect "/questions/#{@question.id}"
end