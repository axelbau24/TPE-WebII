$(document).ready(function(e){

  updateRows(".categoria");
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
    var selected = $(this).val();
    var clasePanel = ".categoria";
    var columnas = "col-lg-6 col-xs-6";
    $(".color-white").each(function() {
      $(this).parents(clasePanel).removeClass("hidden").addClass(columnas);
      if(selected != 0){
        if(selected == $(this).html()){
          $(this).parents("div div").removeClass("row");
          $(this).parents(clasePanel).toggleClass(columnas);
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
