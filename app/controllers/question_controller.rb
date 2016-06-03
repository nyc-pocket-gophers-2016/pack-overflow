get '/' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  if request.xhr?
    erb :'questions/_new_question_form', layout: false
  else
    erb :'questions/new'
  end
end

post '/questions' do
  params[:question][:user_id] = current_user.id
  @question = Question.new(params[:question]) #create new question
  if @question.save #saves new question or returns false if unsuccessful
    erb :'questions/_question_item', layout: false, locals: {question: @question} #redirect back to questions index page
  else
    erb :'questions/_question_item' # show new questions view again(potentially displaying errors)
  end
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  if current_user && current_user == @question.user 
    erb :"/questions/_edit_question"
  else
    redirect '/questions/:id'
  end
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.assign_attributes(title: params[:question][:title], body: params[:question][:body])
  @error = "You have entered misinformation, please try again."
  if @question.save
    redirect "/"
  else
    erb :"questions/_edit_question"
  end
end


get '/questions/:id' do
  @question = Question.find(params[:id]) #define instance variable for view
  erb :'questions/show' #show single question view
end
