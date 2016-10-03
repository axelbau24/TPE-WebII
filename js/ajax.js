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



  addAjax(".borrarCategoria", "eliminar_categoria&id=", ".listado", "La categoría se eliminó correctamente");
  addAjax(".editarCategoria", "editar_categoria&id=", ".listado", "La categoría se editó correctamente");
  addAjax(".addCategoria", "agregar_categoria", ".listado", "La categoría se agregó correctamente", 0);

  function addAjax(form, action, aCargar, msgSuccess, id) {
      $(document).on("submit", form, function() {
          event.preventDefault();  
          $.post( "index.php?action="+ action + ((id == 0) ? "" : $(this).attr("data-id")), $(this).serialize(), function(data) {
            $(aCargar).html(data);
            clearModal();
            toastr.success(msgSuccess);
          }).fail(function() { toastr.error('Hubo un error'); });

      });
    }

  function clearModal() {
    $(".modal-backdrop").remove();
  }


});
