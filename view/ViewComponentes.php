<?php
include_once("libs/Smarty.class.php");
class ViewComponentes
{
  private $smarty;
  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function mostrarComponentes()
  {
    $this->smarty->display("componentes.tpl");

  }
}

 ?>
