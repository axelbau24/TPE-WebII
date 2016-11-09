<?php
include_once("view/View.php");

class ViewContacto extends View{

  function mostrarFormulario(){
    $this->smarty->display('contacto.tpl');
  }

  function mostrarConsultas($consultas){
    $this->smarty->assign("consultas", $consultas);
    $this->smarty->display('listaConsultas.tpl');
  }
}

 ?>
