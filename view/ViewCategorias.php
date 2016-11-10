<?php
include_once("view/View.php");

class ViewCategorias extends View{

  function mostrar($categorias){
    $this->smarty->assign('categorias',$categorias);
    $this->smarty->display('listaCategorias.tpl');
  }

}



 ?>
