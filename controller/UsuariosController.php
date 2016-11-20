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
    $default_rol = 3;
    $newUsuario = [];
    $newUsuario["usuario"] = $_POST['usuario'];
    $newUsuario["email"] = $_POST['email'];
    $newUsuario["password"] = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $newUsuario["rol"] = $default_rol;
    return $newUsuario;
  }
  function agregar_usuario(){
    if($this->datosValidos()){
      $newUsuario = $this->crearUsuario();
      $newUsuario["rol"] = $_POST["rol"];
      print_r($newUsuario);
      $this->model->crearUsuario($newUsuario);

    }
    $this->admin_usuarios();
  }
  function buscar_usuario(){
    if(isset($_POST['busqueda'])){
      $nombre = $_POST['busqueda'];
      $roles = $this->model->getRoles();
      $usuario= $this->model->getUsuario($nombre);
      $this->view->mostrarAdminUsuarios(array($usuario),$roles);
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
      $permisos = $this->model->getPermisos();
      $usuarios = $this->model->getUsuarios();
      $roles = $this->model->getRoles();
      $this->view->mostrarAdminUsuarios($usuarios, $roles, $permisos);
  }

  function editar_usuario(){
    echo "stringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstringstring";
    if( (isset($_GET['id'])) && (isset($_POST['username'])) && (isset($_POST['email'])) && (isset($_POST['rol']))){
    $usuario["username"] = $_POST['username'];
    $usuario["email"] = isset($_POST['email']);
    $usuario["id_rol"] = $_POST['rol'];
    $usuario['id_usuario'] = $_GET['id'];
    print_r($usuario);
    $this->model->editarUsuario($usuario);
    }
    $this->admin_usuarios();
  }
}

?>
