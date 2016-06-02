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


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
