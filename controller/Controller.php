<?php
include_once("models/ModelUsuarios.php");
abstract class Controller{

  protected $model;
  protected $view;
  protected $modelUsuario;

  function __construct(){
    $this->modelUsuario = new ModelUsuarios();
  }

  function asignarPermisos(){
    $permisos = [];
    if(isset($_SESSION["user"])) $permisos = $this->modelUsuario->getPermisosDenegados($_SESSION["user"]);
    else $permisos = $this->modelUsuario->getPermisosVisitante();
    $this->view->actualizarPermisos($permisos);
    return $permisos;
  }
}

 ?>
