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
  # binding.pry
  # params[:question][:view_count] = 0
  params[:question][:user_id] = current_user.id

  @question = Question.new(params[:question]) #create new question
  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions' # show new questions view again(potentially displaying errors)
  end
end


get '/questions/:id' do
  @question = Question.find(params[:id]) #define instance variable for view
  erb :'questions/show' #show single question view
end
