$(document).ready(function(e){

  $.get( "index.php?action=home", function(data) {$(".listado").html(data);});

  // Se agrega /click o /submit para arreglar carga del selector despues de partial render
  addAjax("#home/click", "home", ".listado", 0, 0);
  addAjax("#componentes/click", "mostrar_componentes", ".listado", 0, 0);
  addAjax("#categorias/click", "mostrar_categorias", ".listado", 0, 0);
  addAjax("#consultas/click", "mostrar_consultas", ".listado", 0, 0);
  addAjax("#contacto/click", "mostrar_formulario_consulta", ".listado", 0, 0);
  addAjax(".categorias/click", "mostrar_componentes&categoria=", ".cat-");
  addAjax(".borrarCategoria/submit", "eliminar_categoria&id=", ".listado", "La categoría se eliminó correctamente");
  addAjax(".editarCategoria/submit", "editar_categoria&id=", ".listado", "La categoría se editó correctamente");
  addAjax(".editarComponente/submit", "editar_componente&id=", ".listado", "El componente se editó correctamente");
  addAjax(".mostrarComponente/click", "mostrar_componente&id=", ".listado");
  addAjax(".eliminarComponente/click", "eliminar_componente&id=", ".listado", "El componente se eliminó correctamente");
  addAjax(".addCategoria/submit", "agregar_categoria", ".listado", "La categoría se agregó correctamente", 0);
  addAjax(".addComponente/submit", "agregar_componente", ".listado", "El componente se agregó correctamente", 0);
  addAjax(".contacto/submit", "agregar_consulta", "", "La consulta se envió correctamente", 0, function() {
    $("input, textarea").each(function() {
      $("input, textarea").val("");
    });
  });
  addAjax(".eliminarConsulta/click", "eliminar_consulta&id=", ".listado", "La consulta se eliminó correctamente");


  $(document).on('change', '.categorias', function() {
    var valor = $(this).val();
    var url = "index.php?action=filtrar_categoria&id=" + valor;
    if(valor == 0) url = "index.php?action=home";
    $.post(url, function(data) {
      if(valor == 0) $(".listado").html(data)
      else $(".contenido-componentes").html(data);
    });
  });

  function addAjax(form, action, aCargar, msgSuccess, id, extra) {
    var datos = form.split("/");
    var metodo = datos[1];
    var selector = datos[0];
    $(document).on(metodo, selector, function(ev) {
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
           if(msgSuccess != undefined && msgSuccess != 0) toastr.success(msgSuccess);
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
