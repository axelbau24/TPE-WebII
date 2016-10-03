<?php
require_once('libs/Smarty.class.php');

class ViewCategorias
{
  private $smarty;

  function __construct()
  {
    $this->smarty = new Smarty();
  }

  function agregarError($error){
    $this->smarty->assign('error',$error);
  }

  function mostrarMensaje($mensaje, $tipo){
    $this->smarty->assign('mensaje',$mensaje);
    $this->smarty->assign('tipoMensaje',$tipo);
  }

  function mostrar($categorias){
    $this->smarty->assign('categorias',$categorias);
    $this->smarty->display('categorias.tpl');
  }
  function mostrarLista($categorias){
    $this->smarty->assign('categorias',$categorias);
    $this->smarty->display('listaCategorias.tpl');
  }


}



 ?>
