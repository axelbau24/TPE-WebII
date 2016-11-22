<?php
require_once(dirname(__DIR__). '/libs/Smarty.class.php');
class View{

  protected $smarty;

  function __construct() {
    $this->smarty = new Smarty();
  }

  function actualizarPermisos($nuevos, $datosUser){
     $this->smarty->assign("permisos", $nuevos);
     $this->smarty->assign("datosUsuario", $datosUser);
  }


}


 ?>
