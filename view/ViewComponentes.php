<?php
include_once("libs/Smarty.class.php");
class ViewComponentes
{
  private $smarty;
  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function mostrarComponentes($componentes)
  {
    $this->smarty->assign("componentes", $componentes);
    $this->smarty->display("componentes.tpl");

  }
}

 ?>
