<?php
include_once("libs/Smarty.class.php");
class ViewComponentes
{
  private $smarty;

  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function asignarDatos($datos)
  {
    $this->smarty->assign("categorias", $datos["categorias"]);
    $this->smarty->assign("componentes", $datos["componentes"]);
  }

  function mostrarComponentes()
  {
    $this->smarty->display("componentes.tpl");
  }
  function filtrar($componentes, $categoria)
  {
    $this->smarty->assign("categorias", $categoria);
    $this->smarty->assign("componentes", $componentes);
    $this->smarty->assign("filtro", true);
    $this->smarty->display("componentesCategoria.tpl");
  }

  function mostrarComponentesCategoria($componentes)
  {
    $this->smarty->assign("componentes", $componentes);
    $this->smarty->display("filtroComponentes.tpl");
  }

  function mostrarAdmin()
  {
    $this->smarty->display("adminComponentes.tpl");
  }

  function listaAdmin(){
    $this->smarty->display("listaComponentes.tpl");
  }

  function mostrarComponente($categoria, $componente)
  {
    $this->smarty->assign("categoria", $categoria);
    $this->smarty->assign("componente", $componente);
    $this->smarty->display("componente.tpl");
  }
}

 ?>
