<?php
include_once("view/View.php");
class ViewComponentes extends View{

  function asignarDatos($datos)
  {
    $this->smarty->assign("categorias", $datos["categorias"]);
    $this->smarty->assign("componentes", $datos["componentes"]);
  }

  function mostrarComponentes(){
    $this->smarty->display("componentes.tpl");
  }

  function filtrar(){
    $this->smarty->display("componentesCategoria.tpl");
  }

  function mostrarComponentesCategoria($componentes){
    $this->smarty->assign("componentes", $componentes);
    $this->smarty->display("filtroComponentes.tpl");
  }

  function mostrarAdmin(){
    $this->smarty->display("adminComponentes.tpl");
  }

  function mostrarHome(){
    $this->smarty->display("header.tpl");
  }

  function mostrarComponente($categoria, $componente) {
    $this->smarty->assign("categoria", $categoria);
    $this->smarty->assign("componente", $componente);
    $this->smarty->display("componente.tpl");
  }
}

 ?>
