$(document).ready(function(e){

  addAjax("#home", "", ".listado");
  addAjax("#componentes", "mostrar_componentes", ".listado", undefined, 0);
  addAjax("#categorias", "mostrar_categorias", ".listado", undefined, 0);
  addAjax("#consultas", "mostrar_consultas", ".listado", undefined, 0);
  addAjax("#contacto", "mostrar_formulario_consulta", ".listado", undefined, 0);
  addAjax(".categorias", "mostrar_componentes&categoria=", ".cat-");
  addAjax(".borrarCategoria", "eliminar_categoria&id=", ".listado", "La categoría se eliminó correctamente");
  addAjax(".editarCategoria", "editar_categoria&id=", ".listado", "La categoría se editó correctamente");
  addAjax(".editarComponente", "editar_componente&id=", ".listado", "El componente se editó correctamente");
  addAjax(".mostrarComponente", "mostrar_componente&id=", ".listado");
  addAjax(".eliminarComponente", "eliminar_componente&id=", ".listado", "El componente se eliminó correctamente");
  addAjax(".addCategoria", "agregar_categoria", ".listado", "La categoría se agregó correctamente", 0);
  addAjax(".addComponente", "agregar_componente", ".listado", "El componente se agregó correctamente", 0);
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
    $(document).on((($(form).prop("tagName") == "FORM") ? "submit" : "click"), form, function(ev) {
      var formData = new FormData(this);
      ev.preventDefault();
      id = (id == 0) ? "" : $(this).attr("data-id");

      $.ajax({
         method: "POST",
         url: "index.php?action="+ action + id,
         data: formData,
         contentType: false,
         cache: false,
         processData:false,
         success: function(data) {
           if(aCargar.indexOf("-") >= 0) $(aCargar + id).html(data);
           else $(aCargar).html(data);
           $(".modal-backdrop").remove();
           if(extra != undefined) extra();
           if(msgSuccess != undefined) toastr.success(msgSuccess);
         }
       })
    });
  }

  toastr.options = {
    "debug": false,
    "newestOnTop": false,
    "positionClass": "toast-bottom-right",
    "closeButton": true,
    "timeOut": "1600"
  };

  $(document).on("click", ".img-thumbnail", function(){
    $(this).toggleClass("check");
  });


  $(document).on("click", ".categorias", function() {
    $(this).parent().find("div").toggle();
  });

});
