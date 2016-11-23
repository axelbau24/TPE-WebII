<?php
include_once("view/View.php");

class ViewRoles extends View{

  function actualizarDatos($actions, $roles, $permisos){
    $this->smarty->assign("actions", $actions);
    $this->smarty->assign("permiso", $permisos);
    $this->smarty->assign("roles", $roles);
  }

  function mostrarAdminRoles(){
    $this->smarty->display("adminRoles.tpl");
  }

}
