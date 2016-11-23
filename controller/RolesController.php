<?php

define('ADMIN_EDIT_ROL', '1');

include_once ("view/ViewRoles.php");
include_once("controller/Controller.php");
require_once('models/ModelRoles.php');

class RolesController extends Controller{

  function __construct() {
    parent::__construct();
    $this->model = new ModelRoles();
    $this->view = new ViewRoles();
    parent::asignarPermisos();
  }

  function admin_roles(){
    $this->setData();
    $this->view->mostrarAdminRoles();
  }
  function update_permisos(){
    if(isset($_GET["id_rol"]) && !empty($_GET["id_rol"])){
      $permisos = $this->model->getPermisos($_GET["id_rol"]);
      $this->updatePermisos($_GET["id_rol"]);
    }
    $this->setData();
    $this->view->mostrarAdminRoles();
  }

  // Método que se encarga de actualizar todos los datos necesarios del admin de roles
  // para luego mostrarlos en la vista.
  function setData(){
    $actions = $this->model->getActions();
    $roles = $this->model->getRoles();

    for ($i=0; $i < count($roles); $i++) {
      $roles[$i]["cantUsuarios"] = $this->model->getCantUsuariosEnRol($roles[$i]["id_rol"]);
    }
    $rolFiltrado = ADMIN_EDIT_ROL;
    if(isset($_GET["filtrar_rol"]) && !empty($_GET["filtrar_rol"])) $rolFiltrado = $_GET["filtrar_rol"];

    $permisos = $this->model->getPermisos($rolFiltrado);
    $permisos["rol"] = $this->model->getRol($rolFiltrado);
    $this->view->actualizarDatos($actions, $roles, $permisos);
  }


  // Método utilizado para actualizar los permisos de un rol
  function updatePermisos($rol){
    $actions = $this->model->getActions();
    foreach ($actions as $action) {
      if(!isset($_POST["id_" . $action["id_accion"]])){
        $this->model->addPermiso($rol, $action["id_accion"]);
      }
      elseif (isset($_POST["id_" . $action["id_accion"]]) && !empty($_POST["id_" . $action["id_accion"]])) $this->model->eliminarPermiso($rol, $action["id_accion"]);
    }
  }

  function agregar_rol(){
    if(isset($_POST['nombre']) && !empty($_POST['nombre'])){
      $rol = $this->model->agregarRol($_POST['nombre']);
      $this->updatePermisos($rol["id_rol"]);
    }
    $this->admin_roles();
  }

  function eliminar_rol(){
    if(isset($_GET["id_rol"]) && !empty($_GET["id_rol"])) $this->model->eliminarRol($_GET["id_rol"]);
    $this->admin_roles();
  }
}

?>
