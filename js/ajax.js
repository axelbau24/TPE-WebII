$(document).ready(function(e){

  addAjax(".categorias", "mostrar_componentes&categoria=", ".cat-");
  addAjax(".borrarCategoria", "eliminar_categoria&id=", ".listado", "La categoría se eliminó correctamente");
  addAjax(".editarCategoria", "editar_categoria&id=", ".listado", "La categoría se editó correctamente");
  addAjax(".addCategoria", "agregar_categoria", ".listado", "La categoría se agregó correctamente", 0);
  addAjax(".contacto", "agregar_consulta", "", "La consulta se envió correctamente", 0, function() {
    $("input, textarea").each(function() {
      $("input, textarea").val("");
    });
  });
  addAjax(".eliminarConsulta", "eliminar_consulta&id=", ".listado", "La consulta se eliminó correctamente");


  $('.categorias').on('change', function() {
    var valor = $(this).val();
    var url = "index.php?action=filtrar_categoria&id=" + valor;
    if(valor == 0) url = "index.php";
    $.post(url, function(data) {
      if(valor == 0) $("body").html(data)
      else $(".contenido-componentes").html(data);
    });
  });

  function addAjax(form, action, aCargar, msgSuccess, id, extra) {
    $(document).on((($(form).prop("tagName") == "FORM") ? "submit" : "click"), form, function() {
      event.preventDefault();
      id = (id == 0) ? "" : $(this).attr("data-id");
      $.post( "index.php?action="+ action + id, $(this).serialize(), function(data) {
        if(aCargar.indexOf("-") >= 0) $(aCargar + id).html(data);
        else $(aCargar).html(data);
        $(".modal-backdrop").remove();
        if(extra != undefined) extra();
        if(msgSuccess != undefined) toastr.success(msgSuccess);
      }).fail(function() { toastr.error('Hubo un error'); });
    });
  }

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


  $(document).on("click", ".categorias", function() {
    $(this).parent().find("div").toggle();
  });

});
