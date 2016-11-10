<?php
include_once ("models/ModelUsuarios.php");
include_once ("view/ViewUsuarios.php");
require_once ('config/ConfigApp.php');
class UsuariosController{

  private $model;
  private $view;

  function __construct() {
    $this->model = new ModelUsuarios();
    $this->view = new ViewUsuarios();
  }

  function autorizado($action){
    session_start();
    $usuario = "";
    $permisos = [];
    if(isset($_SESSION["user"])){
      $usuario = $_SESSION["user"];
      $permisos = $this->model->getPermisos($usuario);
    } else $permisos = $this->model->getPermisosVisitante();
    // Al momento de registrar un usuario, verificar que no pueda ser espacios en blanco

    foreach ($permisos as $permiso) {
      if($permiso["accion_denegada"] === $action) return false;
    }
    return true;
  }
  function login(){
    if(isset($_POST["username"]) && isset($_POST["password"])){
      $user = $_POST["username"];
      $password = $_POST["password"];
      $usuarioRegistrado = $this->model->getUsuario($user);
      $passwordRegistrada = $usuarioRegistrado["password"];
      if (password_verify($password, $passwordRegistrada)){
        $grupos = $this->model->getGrupos($user);
        $nuevoGrupos = [];
        foreach ($grupos as $grupo) {
          array_push($nuevoGrupos, $grupo["nombre"]);
        }
        $_SESSION["user"] = $user;
        $_SESSION["email"] = $usuarioRegistrado["email"];
        header("Location: index.php"); die();
      } else {
        $this->view->agregarError('Usuario o contraseña incorrectos');
      }
    }
     $this->view->mostrarLogin();


  }
  function logout(){
    session_destroy();
    header("Location: index.php"); die();
  }

}

?>
