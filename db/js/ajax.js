$(".database").submit(function(ev) {
  ev.preventDefault();
  $.post( "index.php", $(this).serialize(), function(data) {
    $(".errors").html(data).hide().show("slow");
  });

});
