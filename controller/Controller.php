<?php
include_once(dirname(__DIR__). "/models/ModelUsuarios.php");
abstract class Controller{

  protected $model;
  protected $view;
  protected $modelUsuario;

  function __construct(){
    $this->modelUsuario = new ModelUsuarios();
  }
  // Se obtienen los permisos del usuario si es que esta logueado, para luego enviarlos a la vista.
  function asignarPermisos(){
    $permisos = [];
    $usuario = [];
    if(isset($_SESSION["id"]) && isset($_SESSION["user"]) && isset($_SESSION["email"])) {
      $permisos = $this->modelUsuario->getPermisosUsuario($_SESSION["id"]);
      $usuario = $this->modelUsuario->getUsuarioById($_SESSION["id"]);
    }
    else $permisos = $this->modelUsuario->getPermisosVisitante();
    $this->view->actualizarPermisos($permisos, $usuario);
    return $permisos;
  }
}

 ?>
