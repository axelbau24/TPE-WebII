<?php
include_once("view/View.php");
class ViewComponentes extends View{

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

  function mostrarAdmin($permisos)
  {
    $this->smarty->assign("permisos", $permisos);
    $this->smarty->display("listaComponentes.tpl");
  }

  function mostrarHome($permisos){

    if(isset($_SESSION["user"])){
      $this->smarty->assign("sesion", $_SESSION);
    }
    $this->smarty->assign("permisos", $permisos);
    $this->smarty->display("header.tpl");
  }

  function mostrarComponente($categoria, $componente) {
    $this->smarty->assign("categoria", $categoria);
    $this->smarty->assign("componente", $componente);
    $this->smarty->display("componente.tpl");
  }
}

 ?>
