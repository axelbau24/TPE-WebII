<?php
include_once("view/View.php");

class ViewCategorias extends View{

  function mostrar($categorias, $permisos){
    $this->smarty->assign('permisos', $permisos);
    $this->smarty->assign('categorias',$categorias);
    $this->smarty->display('listaCategorias.tpl');
  }

}



 ?>
