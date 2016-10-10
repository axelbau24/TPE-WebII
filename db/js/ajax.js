$(".database").submit(function() {
  event.preventDefault();
  $.post( "index.php", $(this).serialize(), function(data) {
    $(".errors").html(data).hide().show("slow");
  });

});
