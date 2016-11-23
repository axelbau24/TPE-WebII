<?php
define('DEFAULT_ROL', '3');
define('USUARIOS_A_MOSTRAR', '4');

include_once (dirname(__DIR__). "/view/ViewUsuarios.php");
include_once(dirname(__DIR__). "/controller/Controller.php");

class UsuariosController extends Controller{

  function __construct() {
    parent::__construct();
    $this->model = $this->modelUsuario;
    $this->view = new ViewUsuarios();
    session_start();
    $this->checkTiempoSesion();
  }
  // Lo primero que se llama antes de ejecutar cualquier método, comprueba que el usuario este
  // autorizado a ejecutar dicho método
  function autorizado($action){
    $permisos = $this->asignarPermisos();
    if(in_array($action, $permisos)) return false;
    return true;
  }

  // Si el usuario al ingresar no marco "Mantener sesion iniciada", su sesión se cerrará luego de 5 minutos (300 segundos)
  function checkTiempoSesion(){
    if(isset($_SESSION["tiempo"])) {
      if(time() - $_SESSION["tiempo"] > 300) $this->logout();
      else $_SESSION["tiempo"] = time();
    }
  }

  function login(){
    if(isset($_POST["usuario"]) && isset($_POST["password"]) && !empty($_POST["usuario"]) && !empty($_POST["password"])){
      $user = $_POST["usuario"];
      $password = $_POST["password"];
      $usuarioRegistrado = $this->model->getUsuario($user);
      $passwordRegistrada = $usuarioRegistrado["password"];
      if (password_verify($password, $passwordRegistrada)){
        if(!isset($_POST["mantenerSesion"])) $_SESSION["tiempo"] = time();
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
    if($this->datosValidos() && isset($_POST["r_password"]) && !empty($_POST["r_password"])){
      if($_POST['password'] === $_POST["r_password"]){
        $newUsuario = $this->crearUsuario();
        if(count($newUsuario) > 0){
            $this->model->crearUsuario($newUsuario);
            $this->login();
        }
        else $this->view->agregarError('El nombre de usuario elegido ya existe');
      }
    }
    $this->view->mostrarRegistro();
  }

  function datosValidos(){
    return (isset($_POST['usuario'])) && (isset($_POST['password'])) && (isset($_POST['email'])) && (!empty($_POST['usuario'])) && (!empty($_POST['email'])) && (!empty($_POST['password']));
  }

  // Metodo utilizado por "registrar()" y "agregar_usuario()" (Perteneciente a la seccion admin usuarios)
  function crearUsuario(){
    $newUsuario = [];
    $usuarioCheck = $this->model->getUsuario($_POST['usuario']);
    if(count($usuarioCheck) === 1){
        $newUsuario["usuario"] = $_POST['usuario'];
        $newUsuario["email"] = $_POST['email'];
        $newUsuario["password"] = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $newUsuario["rol"] = DEFAULT_ROL;
    }
    return $newUsuario;
  }
  // Desde el admin de usuarios agrego manualmente usuarios, sin tener que ir al form de registro.
  function agregar_usuario(){
    if($this->datosValidos() && isset($_POST["rol"]) && !empty($_POST["rol"])){
      $newUsuario = $this->crearUsuario();
      if(count($newUsuario) > 0){
        $newUsuario["rol"] = $_POST["rol"];
        $this->model->crearUsuario($newUsuario);
      } else die();
    }
    $this->admin_usuarios();
  }

  function getAvatarPath($img_avatar, $usuario){
    $avatar = [];
      $extension = $img_avatar["type"];
      if($extension == "image/jpeg" || $extension == "image/png"){
        $avatar["ext"] = "." . explode("/", $extension)[1];
        $avatar["tmp_name"] = $img_avatar["tmp_name"];
      }
      $ruta = $usuario["avatar"];
      if(!empty($avatar)){
        $ruta = "images/avatar/" . uniqid() . "_user_" . $usuario["id_usuario"]  . $avatar["ext"];
        move_uploaded_file($avatar["tmp_name"], $ruta);
        if (!strpos($usuario["avatar"], 'default')) unlink($usuario["avatar"]);
      }
    return $ruta;
  }


  function configurar_perfil(){
    if(isset($_SESSION['id']) && isset($_SESSION['user']) && isset($_SESSION["email"])){
      $usuario = $this->model->getUsuarioById($_SESSION['id']);

      if(isset($_POST['email']) && !empty($_POST['email'])){
        $usuario["email"] = $_POST['email'];
        $this->model->editarDatos($usuario);
      }

      if(isset($_POST['password']) && !empty($_POST['password']) && isset($_POST['new_password'])
      && !empty($_POST['new_password']) && isset($_POST['c_new_password']) && !empty($_POST['c_new_password'])){
        $password = $_POST['password']; // Password actual
        $passwordRegistrada = $usuario['password'];
        // Se verifican que la contraseña ingresada sea valida con la del usuario
        // y luego se comprueba que la nueva contraseña este confirmada con el otro campo
        if(password_verify($password, $passwordRegistrada) && $_POST['new_password'] == $_POST['c_new_password']){
          $usuario["password"] = password_hash($_POST['new_password'], PASSWORD_DEFAULT);
          $this->model->editarDatos($usuario);
        }
        else $this->view->agregarError('La contraseña ingresada o la confirmación son incorrectas.');

      }
      if(isset($_FILES['avatar']) && !empty($_FILES['avatar'])){
        $usuario["avatar"] = $this->getAvatarPath($_FILES['avatar'], $usuario);
        $this->model->editarDatos($usuario);
      }
      // Actualizo todos los datos del usuario
      $usuario = $this->model->getUsuarioById($_SESSION['id']);
      $this->view->configurarPerfil($usuario);
    }
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
    header("Location: index.php");die();
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

  // Método que se encarga de actualizar todos los datos necesarios del admin de usuarios
  // para luego mostrarlos en la vista.
  function setData(){
    $users = $this->model->getUsuarios();
    $roles = $this->model->getRoles();

    if(isset($_GET["cantUsuarios"]) && !empty($_GET["cantUsuarios"])){
      $usuarios = array_slice($users, 0, $_GET["cantUsuarios"]);
    } else $usuarios = array_slice($users, 0, USUARIOS_A_MOSTRAR);

    $this->view->actualizarDatos($usuarios, $roles, count($users));
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

}

?>
