<?php
require_once('libs/Smarty.class.php');

class ViewContacto
{
  private $smarty;

  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function agregarError($error){
    $this->smarty->assign('error',$error);
  }

  function mostrarMensaje($mensaje, $tipo){
    $this->smarty->assign('mensaje',$mensaje);
    $this->smarty->assign('tipoMensaje',$tipo);
  }


  function mostrarFormulario(){
    $this->smarty->display('contacto.tpl');
  }

}



 ?>
