<?php
include_once("view/View.php");
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
  function mostrarAdminUsuarios(){
    $this->smarty->display("adminUsuarios.tpl");
  }

}
 ?>
