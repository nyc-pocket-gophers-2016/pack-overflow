get '/' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  if request.xhr?
    erb :'questions/_new_question_form', layout: false
  end
end