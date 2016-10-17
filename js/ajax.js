$(document).ready(function(e){
  // Al ingresar a la página se obtienen los listados
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
         }
       })
    });
  }
  // Configuración plugin de alertas
  toastr.options = {
    "debug": false,
    "newestOnTop": false,
    "positionClass": "toast-bottom-right",
    "closeButton": true,
    "timeOut": "1600"
  };

  // Cambio de la clase "active" entre los menús
  $("nav li a").click(function() {
    $("nav li a").each(function() { $(this).parent().removeClass("active"); });
    $(this).parent().addClass("active");
  });

  // Agrego efecto de selección al hacer click en una imagen
  $(document).on("click", ".img-thumbnail", function(){
    $(this).toggleClass("check");
  });

  // Sección Lista de categorias, se usa esto para mostrar los componentes en esa categoria
  $(document).on("click", ".categorias", function() {
    $(this).parent().find("div").toggle();
  });

  // Filtro de categorias obtenido por base de datos
  $(document).on('change', '.categorias', function() {
    var valor = $(this).val();
    var url = "index.php?action=filtrar_categoria&id=" + valor;
    if(valor == 0) url = "index.php?action=home";
    $.post(url, function(data) {
      if(valor == 0) $(".listado").html(data)
      else $(".contenido-componentes").html(data);
    });
  });
});
