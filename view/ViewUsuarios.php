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
  function actualizarDatos($usuarios, $roles, $cantUsuarios){
    $this->smarty->assign("cantUsuarios", $cantUsuarios);
    $this->smarty->assign("usuarios", $usuarios);
    $this->smarty->assign("roles", $roles);
  }
  function actualizarBusqueda($usuario){
    $this->smarty->assign("usuarios", array($usuario));
  }
  function mostrarAdminUsuarios(){
    $this->smarty->display("adminUsuarios.tpl");
  }
  function configurarPerfil($usuario){
    $this->smarty->assign("usuario", $usuario);
    $this->smarty->display("userConfig.tpl");
  }

}
 ?>
