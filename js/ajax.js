$(document).ready(function(e){
  // Al ingresar a la página se obtienen los listados
  $.get( "index.php?action=home", function(data) {$(".listado").html(data);});

  // Se agrega /click o /submit para arreglar carga del selector despues de partial render
  addAjax(".nav-home/click", "home", ".listado", 0, 0);
  addAjax(".nav-usuarios/click", "admin_usuarios", ".listado", 0, 0);
  addAjax(".nav-componentes/click", "admin_componentes", ".listado", 0, 0);
  addAjax(".nav-categorias/click", "admin_categorias", ".listado", 0, 0);
  addAjax(".nav-consultas/click", "mostrar_consultas", ".listado", 0, 0);
  addAjax(".nav-contacto/click", "mostrar_formulario_consulta", ".listado", 0, 0);
  addAjax(".categorias/click", "filtrar_categoria&categoria=", ".cat-");
  addAjax(".borrarCategoria/submit", "eliminar_categoria&id=", ".listado", "La categoría se eliminó correctamente");
  addAjax(".editarCategoria/submit", "editar_categoria&id=", ".listado", "La categoría se editó correctamente");
  addAjax(".editarComponente/submit", "editar_componente&id=", ".listado", "El componente se editó correctamente");
  addAjax(".mostrarComponente/click", "mostrar_componente&id=", ".listado");
  addAjax(".eliminarComponente/click", "eliminar_componente&id=", ".listado", "El componente se eliminó correctamente");
  addAjax(".addCategoria/submit", "agregar_categoria", ".listado", "La categoría se agregó correctamente", 0);
  addAjax(".addComponente/submit", "agregar_componente", ".listado", "El componente se agregó correctamente", 0);
  addAjax(".eliminarConsulta/click", "eliminar_consulta&id=", ".listado", "La consulta se eliminó correctamente");
  addAjax(".contacto/submit", "agregar_consulta", "", "La consulta se envió correctamente", 0, function() {
    $("input, textarea").each(function() {
      $("input, textarea").val("");
    });
  });

  // Función genérica para ajax
  function addAjax(selector, action, aCargar, msgSuccess, id, extra) {
    var datos = selector.split("/");
    var tipo = datos[1];
    selector = datos[0];
    $(document).on(tipo, selector, function(ev) {
      $(".carga").toggleClass("hidden");
      var formData = null;
      var method = "GET";
      if (tipo == "submit") {
        formData = new FormData(this);
        method = "POST";
      }
      ev.preventDefault();
      id = (id == 0) ? "" : $(this).attr("data-id");
      $.ajax({
        method: method,
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
          $(".carga").toggleClass("hidden");
        }
      })
    });
  }

  // Sección Lista de categorias, se usa esto para mostrar los componentes en esa categoria
  $(document).on("click", ".categorias", function() {
    $(this).parent().find("div").toggle();
  });

  // Filtro de categorias obtenido por base de datos
  $(document).on('change', '.categorias', function() {
    var valor = $(this).val();
    var url = "index.php?action=filtrar_categoria&id=" + valor;
    if(valor == 0) url = "index.php?action=home";
    $.get(url, function(data) {
      if(valor == 0) $(".listado").html(data)
      else $(".contenido-componentes").html(data);
    });
  });


});
