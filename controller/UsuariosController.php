<?php
define('DEFAULT_ROL', '3');
define('USUARIOS_A_MOSTRAR', '4');
define('ADMIN_EDIT_ROL', '1');

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
    if(isset($_POST["usuario"]) && isset($_POST["password"])){
      $user = $_POST["usuario"];
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
  function registrar(){
    if($this->datosValidos()){
      $newUsuario = $this->crearUsuario();
      $this->model->crearUsuario($newUsuario);
      $this->login();
    }
    $this->view->mostrarRegistro();
  }

  function datosValidos(){
    return (isset($_POST['usuario'])) && (isset($_POST['password'])) && (isset($_POST['email']));
  }

  function crearUsuario(){
    $newUsuario = [];
    $newUsuario["usuario"] = $_POST['usuario'];
    $newUsuario["email"] = $_POST['email'];
    $newUsuario["password"] = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $newUsuario["rol"] = DEFAULT_ROL;
    return $newUsuario;
  }
  function agregar_usuario(){
    if($this->datosValidos()){
      $newUsuario = $this->crearUsuario();
      $newUsuario["rol"] = $_POST["rol"];
      $this->model->crearUsuario($newUsuario);
    }
    $this->admin_usuarios();
  }
  function buscar_usuario(){
    if(isset($_POST['busqueda'])){
      $nombre = $_POST['busqueda'];
      $this->setData();
      $usuario = $this->model->getUsuario($nombre);
      $this->view->actualizarBusqueda($usuario);
      $this->view->mostrarAdminUsuarios();
    }
  }
  function logout(){
    session_destroy();
    header("Location: index.php"); die();
  }
  function eliminar_usuario(){
    if(isset($_GET['id'])){
      $key = $_GET['id'];
      $this->model->eliminarUsuario($key);
    }
    $this->admin_usuarios();
  }
  function admin_usuarios(){
    $this->setData();
    $this->view->mostrarAdminUsuarios();
  }
  function update_permisos(){
    if(isset($_GET["id_rol"])){
      $permisos = $this->model->getPermisos($_GET["id_rol"]);
      $this->updatePermisos($_GET["id_rol"]);
    }
    $this->setData();
    $this->view->mostrarAdminUsuarios();
  }

  function setData(){
    $actions = $this->model->getActions();
    $users = $this->model->getUsuarios();
    $cantUsuarios = count($users);
    if(isset($_GET["cantUsuarios"])){
      $usuarios = array_slice($users, 0, $_GET["cantUsuarios"]);
    } else $usuarios = array_slice($users, 0, USUARIOS_A_MOSTRAR);
    $roles = $this->model->getRoles();
    for ($i=0; $i < count($roles); $i++) {
      $roles[$i]["cantUsuarios"] = $this->model->getCantUsuariosEnRol($roles[$i]["id_rol"]);
    }
    $filtrarRol = ADMIN_EDIT_ROL;
    if(isset($_GET["filtrar_rol"])) $filtrarRol = $_GET["filtrar_rol"];
    $permisos = $this->model->getPermisos($filtrarRol);
    $permisos["rol"] = $this->model->getRol($filtrarRol);
    $this->view->actualizarDatos($usuarios, $roles, $actions, $permisos, $cantUsuarios);
  }

  function editar_usuario(){
    if( (isset($_GET['id'])) && (isset($_POST['username'])) && (isset($_POST['email'])) && (isset($_POST['rol']))){
      $usuario["username"] = $_POST['username'];
      $usuario["email"] = $_POST['email'];
      $usuario["id_rol"] = $_POST['rol'];
      $usuario['id_usuario'] = $_GET['id'];
      $this->model->editarUsuario($usuario);
    }
    $this->admin_usuarios();
  }

  function updatePermisos($rol){
    $actions = $this->model->getActions();
    foreach ($actions as $action) {
      if(!isset($_POST["id_" . $action["id_accion"]])){
        $this->model->addPermiso($rol, $action["id_accion"]);
      }
      else $this->model->eliminarPermiso($rol, $action["id_accion"]);
    }
  }

  function agregar_rol(){
    if(isset($_POST['nombre'])){
      $rol = $this->model->agregarRol($_POST['nombre']);
      $this->updatePermisos($rol["id_rol"]);
    }
    $this->admin_usuarios();
  }

  function eliminar_rol(){
    if(isset($_GET["id_rol"])) $this->model->eliminarRol($_GET["id_rol"]);
    $this->admin_usuarios();
  }
}

?>
