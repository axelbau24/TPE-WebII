<?php
include_once("libs/Smarty.class.php");
class ViewComponentes
{
  private $smarty;
  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function mostrarComponentes($componentes, $categorias)
  {
    $this->smarty->assign("categorias", $categorias);
    $this->smarty->assign("componentes", $componentes);
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
