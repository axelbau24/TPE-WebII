<?php
class ViewUsuarios extends View{

  function agregarError($error){
    $this->smarty->assign("error", $error);
  }
  function mostrarLogin(){
    $this->smarty->display("login.tpl");
  }

}
 ?>
