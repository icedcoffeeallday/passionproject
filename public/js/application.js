$(document).ready(function() {
  // searchClickHandler();
});

var searchClickHandler = function(){
  $('#week_quality').submit(function(event){
    event.preventDefault();
    var $form = $(this)
    var url = $(this).attr('action');
    var method = $(this).attr('method');

    var ajaxOptions = {url: url, method: method};

    var request = $.ajax(ajaxOptions);

    request.done(function(response){
      $form.append(response);
    })

  })
}
