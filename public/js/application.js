$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  $('#new_question_button').on('click', function(event){
    event.preventDefault();

    $.ajax({
      url: '/questions/new'
    }).done(function(response){

      $('#new_question_button').hide();
      $('#question_container').append(response);
    });
  });

  $('#question_container').on('submit', '#new_question_form', function(event){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: '/questions',
      type: 'post',
      data: $target.serialize()
    }).done(function(response){
      $('#question_list_container').find('ul').prepend(response);
      $('#new_question_form').remove();
      $('#new_question_button').show();
      // $target.clear();
    });

  });


  $('#new_question_comment_button').on('click', function(event){
    event.preventDefault();
    var questionUrl = document.location.pathname
    // debugger;
    $.ajax({
      url: questionUrl + '/comments/new'
    }).done(function(response){
// debugger;
      $('#new_question_button').hide();
      $('#question_container').append(response);
    });

  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
