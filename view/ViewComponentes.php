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
    $this->smarty->assign("componentes_cat", $componentes);
    $this->smarty->display("componentes.tpl");

  }

  function mostrarComponente($categoria, $componente)
  {
    
    $this->smarty->assign("categoria", $categoria);
    $this->smarty->assign("componente", $componente);
    $this->smarty->display("componente.tpl");

  }
}

 ?>
