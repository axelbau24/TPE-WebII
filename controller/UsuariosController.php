<?php
include_once ("view/ViewUsuarios.php");
require_once ('config/ConfigApp.php');
include_once("controller/Controller.php");
class UsuariosController extends Controller{

  function __construct() {
    parent::__construct();
    $this->model = $this->modelUsuario;
    $this->view = new ViewUsuarios();
  }

  function autorizado($action){
    session_start();
    $permisos = $this->asignarPermisos();
    if(in_array($action, $permisos)) return false;
    return true;
  }
  function login(){
    if(isset($_POST["username"]) && isset($_POST["password"])){
      $user = $_POST["username"];
      $password = $_POST["password"];
      $usuarioRegistrado = $this->model->getUsuario($user);
      $passwordRegistrada = $usuarioRegistrado["password"];
      if (password_verify($password, $passwordRegistrada)){
        $_SESSION["id"] = $usuarioRegistrado["id_usuario"];
        $_SESSION["user"] = $usuarioRegistrado["nombre"];
        $_SESSION["email"] = $usuarioRegistrado["email"];
        header("Location: index.php"); die();
      } else $this->view->agregarError('Usuario o contraseña incorrectos');

    }
     $this->view->mostrarLogin();

  }
  function logout(){
    session_destroy();
    header("Location: index.php"); die();
  }

}

?>
