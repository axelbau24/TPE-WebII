$(document).ready(function(e){
  // Al ingresar a la página se obtienen los listados
  $.get( "index.php?action=home", function(data) {$(".listado").html(data);});

  // Se agrega /click o /submit para arreglar carga del selector despues de partial render
  addAjax(".nav-home/click", "home", ".listado", 0, 0);
  addAjax(".nav-componentes/click", "mostrar_componentes", ".listado", 0, 0);
  addAjax(".nav-categorias/click", "mostrar_categorias", ".listado", 0, 0);
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

  // Funcionalidad para el formulario de registro
  $('#passwordCheck').on('input', function() {
    var changer = $("#pwseguridad");
    var valor = $(this).val();
    var cantNumeros = valor.replace(/[^0-9]/g,"").length + 1;
    var cantLetrasUpper = valor.replace(/[^A-Z]/g,"").length + 1;
    var cantEspeciales = valor.match(/[@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/g);
    var nivel = cantLetrasUpper * cantNumeros + valor.length + 1 + (cantEspeciales ? cantEspeciales.length : 0 + 1 * 5);
    if(nivel < 20) changer.html("Insegura").attr('class', 'pwseguridad');
    else if(nivel < 30) changer.html("Mediana").attr('class', 'pwseguridad-med pwseguridad');
    else if(nivel < 40)changer.html("Buena").attr('class', 'pwseguridad-high pwseguridad');
    else if(nivel < 55)changer.html("Extrema").attr('class', 'pwseguridad-ext pwseguridad');
    checkChange($(this));
  });

 $('#newPasswordCheck').on('input', function() { checkChange($(this)); });

  function checkChange(selector) {
    $(selector).next().removeClass("hidden");
    var pw_input1 = $("#passwordCheck");
    var pw_input2 = $("#newPasswordCheck");
    var msg_match = $(".msg-match");
    var submit_button = $(".btn-default");
    if(pw_input1.val() == pw_input2.val()) {
      pw_input2.next().removeClass("glyphicon-remove error-icon").addClass("glyphicon-ok success-icon");
      submit_button.removeAttr("disabled");
      msg_match.addClass("hidden");
    } else {
      pw_input2.next().removeClass("glyphicon-ok success-icon").addClass("glyphicon-remove error-icon");
      submit_button.attr("disabled", "true");
      msg_match.removeClass("hidden");
    }
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
    $("nav li a").each(function() {
      $(this).parent().removeClass("active");
    });
    $(this).parent().addClass("active");
  });

  $("li a div").click(function() {
    $("li a div").each(function() { $(this).removeClass("panel-c-warning"); });
    $(this).addClass("panel-c-warning");
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
    $.get(url, function(data) {
      if(valor == 0) $(".listado").html(data)
      else $(".contenido-componentes").html(data);
    });
  });

  // Filtro de categorias obtenido por javascript
  /*
  $(document).on('change', '.categorias', function() {
  var selected = $(this).val();
  var clasePanel = ".categoria";
  var columnas = "col-lg-6 col-xs-6";
  var columna = "col-lg-12 col-xs-12";
  $(".color-white").each(function() {
  $(this).parents(clasePanel).removeClass("hidden").addClass(columnas).removeClass(columna);
  if(selected != 0){
  if(selected == $(this).attr("data-id")){
  $(this).parents("div div").removeClass("row");
  $(this).parents(clasePanel).addClass(columna).removeClass(columnas);
}
else $(this).parents(clasePanel).toggleClass("hidden");
}
else updateRows(clasePanel);
});
});


function updateRows(clase) {
$(clase).parent("div").removeClass("row")
$(clase + ":odd").parent("div").addClass("row");
}
*/
});
