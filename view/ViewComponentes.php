<?php
include_once("libs/Smarty.class.php");
class ViewComponentes
{
  private $smarty;
  function __construct()
  {
    $this->smarty = new Smarty();
  }


  function asignarDatos($componentes, $categorias)
  {
    $this->smarty->assign("categorias", $categorias);
    $this->smarty->assign("componentes", $componentes);
  }
  function mostrarComponentes($componentes, $categorias)
  {
    $this->asignarDatos($componentes, $categorias);
    $this->smarty->display("componentes.tpl");
  }

  function mostrarComponentesCategoria($componentes)
  {
    $this->smarty->assign("componentes", $componentes);
    $this->smarty->display("listaComponentes.tpl");
  }

  function mostrarAdmin($componentes, $categorias)
  {
    $this->asignarDatos($componentes, $categorias);
    $this->smarty->display("adminComponentes.tpl");
  }

  function mostrarComponente($categoria, $componente)
  {
    $this->smarty->assign("categoria", $categoria);
    $this->smarty->assign("componente", $componente);
    $this->smarty->display("componente.tpl");
  }
}

 ?>
