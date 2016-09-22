$(document).ready(function(e){
  $(".img-thumbnail").click(function(){
    $(this).toggleClass("check");
  });

  toastr.options = {
    "debug": false,
    "newestOnTop": false,
    "positionClass": "toast-bottom-right",
    "closeButton": true,
    "timeOut": "1200"
  };

  $('.compEnvio').on('click', function(event){
    toastr.success('El componente se agregó correctamente');
  });


  $('.homerDemo4').on('click', function(event){
    toastr.error('Hubo un error');
  });

});
// cambiar de lugar este js
