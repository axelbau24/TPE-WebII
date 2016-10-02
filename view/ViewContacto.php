<?php
require_once('libs/Smarty.class.php');

class ViewContacto
{
  private $smarty;

  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function mostrarFormulario(){
    $this->smarty->display('contacto.tpl');
  }

  function mostrarConsultas($consultas){
    $this->smarty->assign("consultas", $consultas);
    $this->smarty->display('consultas.tpl');
  }
}

 ?>
