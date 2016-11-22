<?php
include_once(dirname(__DIR__). "/view/View.php");
class ViewUsuarios extends View{

  function agregarError($error){
    $this->smarty->assign("error", $error);
  }
  function mostrarLogin(){
    $this->smarty->display("login.tpl");
  }
  function mostrarRegistro(){
    $this->smarty->display("register.tpl");
  }
  function actualizarDatos($usuarios, $roles, $actions, $permisos, $cantUsuarios){
    $this->smarty->assign("cantUsuarios", $cantUsuarios);
    $this->smarty->assign("permiso", $permisos);
    $this->smarty->assign("usuarios", $usuarios);
    $this->smarty->assign("roles", $roles);
    $this->smarty->assign("actions", $actions);
  }
  function actualizarBusqueda($usuario){
    $this->smarty->assign("usuarios", array($usuario));
  }
  function mostrarAdminUsuarios(){
    $this->smarty->display("adminUsuarios.tpl");
  }
  function configurarPerfil(){
  //  $this->smarty->assign("usuarios", array($usuario));
    $this->smarty->display("userConfig.tpl");
  }

}
 ?>
