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

  addAjax(".borrarCategoria", "eliminar_categoria&id=", ".listado", "La categoría se eliminó correctamente");
  addAjax(".editarCategoria", "editar_categoria&id=", ".listado", "La categoría se editó correctamente");
  addAjax(".addCategoria", "agregar_categoria", ".listado", "La categoría se agregó correctamente", 0);
  addAjax(".contacto", "agregar_consulta", "", "La consulta se envió correctamente", 0, function() {
    $("input, textarea").each(function() {
      $("input, textarea").val("");
    });
  });
  addAjax(".eliminarConsulta", "eliminar_consulta&id=", ".listado", "La consulta se eliminó correctamente");


  function addAjax(form, action, aCargar, msgSuccess, id, extra) {
    $(document).on((($(form).prop("tagName") == "A") ? "click" : "submit"), form, function() {
      event.preventDefault();
      $.post( "index.php?action="+ action + ((id == 0) ? "" : $(this).attr("data-id")), $(this).serialize(), function(data) {
        $(aCargar).html(data);
        $(".modal-backdrop").remove();
        if(extra != undefined) extra();
        toastr.success(msgSuccess);
      }).fail(function() { toastr.error('Hubo un error'); });
    });
  }

});
