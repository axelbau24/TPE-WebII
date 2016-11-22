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

  // Lo primero que se llama antes de ejecutar cualquier método, comprueba que el usuario este
  // autorizado a ejecutar dicho método
  function autorizado($action){
    session_start();
    $permisos = $this->asignarPermisos();
    if(in_array($action, $permisos)) return false;
    return true;
  }

  function login(){
    if(isset($_POST["usuario"]) && isset($_POST["password"]) && !empty($_POST["usuario"]) && !empty($_POST["password"])){
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
  // Si el usuario mando datos válidos, creo un arreglo con los datos del usuario
  // y lo agrego a la base de datos solo si es unico (que no exista otro con el mismo nombre)
  function registrar(){
    if($this->datosValidos()){
      $newUsuario = $this->crearUsuario();
      if(!$this->usuarioExistente($newUsuario)){
        $this->model->crearUsuario($newUsuario);
        $this->login();
      }
    }
    $this->view->mostrarRegistro();
  }

  // Comprueba que el usuario contenga datos (Si no tiene es porque ya existe)
  function usuarioExistente($newUsuario){
    if(count($newUsuario) > 0) return false;
    else {
      $this->view->agregarError('El nombre de usuario elegido ya existe');
      return true;
    }
  }

  function datosValidos(){
    return (isset($_POST['usuario'])) && (isset($_POST['password'])) && (isset($_POST['email'])) && (!empty($_POST['usuario'])) && (!empty($_POST['password']));
  }

  // Metodo utilizado por "registrar()" y "agregar_usuario()" (Perteneciente a la seccion admin usuarios)
  function crearUsuario(){
    $newUsuario = [];
    $usuarioCheck = $this->model->getUsuario($_POST['usuario']);
    if(count($usuarioCheck) === 1 && isset($_POST["r_password"]) && !empty($_POST["r_password"])){
      if($_POST['password'] === $_POST["r_password"]){
        $newUsuario["usuario"] = $_POST['usuario'];
        $newUsuario["email"] = $_POST['email'];
        $newUsuario["password"] = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $newUsuario["rol"] = DEFAULT_ROL;
      }
    }
    return $newUsuario;
  }
  // Desde el admin de usuarios agrego manualmente usuarios, sin tener que ir al form de registro.
  function agregar_usuario(){
    if($this->datosValidos() && isset($_POST["rol"]) && !empty($_POST["rol"])){
      $newUsuario = $this->crearUsuario();
      if(!$this->usuarioExistente($newUsuario)){
        $newUsuario["rol"] = $_POST["rol"];
        $this->model->crearUsuario($newUsuario);
      } else die();
    }
    $this->admin_usuarios();
  }
  // Se busca un usuario en especifico para hacer ediciones, etc
  function buscar_usuario(){
    if(isset($_POST['busqueda']) && !empty($_POST["busqueda"])){
      $nombre = $_POST['busqueda'];
      $this->setData();
      $usuario = $this->model->getUsuario($nombre);
      if(count($usuario) != 1){
        $this->view->actualizarBusqueda($usuario);
        $this->view->mostrarAdminUsuarios();
      } else $this->admin_usuarios();
    }
  }
  function logout(){
    session_destroy();
    header("Location: index.php"); die();
  }
  function eliminar_usuario(){
    if(isset($_GET['id']) && !empty($_GET["id"])){
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
    if(isset($_GET["id_rol"]) && !empty($_GET["id_rol"])){
      $permisos = $this->model->getPermisos($_GET["id_rol"]);
      $this->updatePermisos($_GET["id_rol"]);
    }
    $this->setData();
    $this->view->mostrarAdminUsuarios();
  }
  // Método que se encarga de actualizar todos los datos necesarios del admin de usuarios
  // para luego mostrarlos en la vista.
  function setData(){
    $actions = $this->model->getActions();
    $users = $this->model->getUsuarios();
    $roles = $this->model->getRoles();

    if(isset($_GET["cantUsuarios"]) && !empty($_GET["cantUsuarios"])){
      $usuarios = array_slice($users, 0, $_GET["cantUsuarios"]);
    } else $usuarios = array_slice($users, 0, USUARIOS_A_MOSTRAR);

    for ($i=0; $i < count($roles); $i++) {
      $roles[$i]["cantUsuarios"] = $this->model->getCantUsuariosEnRol($roles[$i]["id_rol"]);
    }

    $rolFiltrado = ADMIN_EDIT_ROL;
    if(isset($_GET["filtrar_rol"]) && !empty($_GET["filtrar_rol"])) $rolFiltrado = $_GET["filtrar_rol"];

    $permisos = $this->model->getPermisos($rolFiltrado);
    $permisos["rol"] = $this->model->getRol($rolFiltrado);
    $this->view->actualizarDatos($usuarios, $roles, $actions, $permisos, count($users));
  }
  // Edita los datos del usuario
  function editar_usuario(){
    if( (isset($_GET['id'])) && (!empty($_GET['id'])) && (isset($_POST['username']))
      && (!empty($_POST['username'])) && (isset($_POST['email'])) && (!empty($_POST['email']))
      && (!empty($_POST['rol'])) && (isset($_POST['rol']))){

      $usuario["username"] = $_POST['username'];
      $usuario["email"] = $_POST['email'];
      $usuario["id_rol"] = $_POST['rol'];
      $usuario['id_usuario'] = $_GET['id'];
      $this->model->editarUsuario($usuario);
    }
    $this->admin_usuarios();
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
    $this->admin_usuarios();
  }

  function eliminar_rol(){
    if(isset($_GET["id_rol"]) && !empty($_GET["id_rol"])) $this->model->eliminarRol($_GET["id_rol"]);
    $this->admin_usuarios();
  }
}

?>
