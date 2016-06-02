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

get '/questions/:id' do
  @question = Question.find(params[:id]) #define instance variable for view
  erb :'questions/show' #show single question view
end
