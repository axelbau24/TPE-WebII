$(document).ready(function(e){

  toastr.options = {
    "debug": false,
    "newestOnTop": false,
    "positionClass": "toast-bottom-right",
    "closeButton": true,
    "timeOut": "1600"
  };

  $(".img-thumbnail").click(function(){
    $(this).toggleClass("check");
  });
// Cuando se creen otros ajax, habra que cambiar esto
 $(".contacto").submit(function() {
   event.preventDefault();
   $.post( "index.php?action=agregar_consulta", $(this).serialize(), function(data) {
   $("input, textarea").each(function() {
     $("input, textarea").val("");
   });
    toastr.success('La consulta se envio correctamente');
  }).fail(function() { toastr.error('Hubo un error'); });
 });

});
