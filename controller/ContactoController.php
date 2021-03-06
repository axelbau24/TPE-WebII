<?php
include_once("controller/Controller.php");
require_once('view/ViewContacto.php');
require_once('models/ModelContacto.php');

class ContactoController extends Controller{

  function __construct(){
    parent::__construct();
    $this->model = new ModelContacto();
    $this->view = new ViewContacto();
    parent::asignarPermisos();
  }

  function agregar_consulta(){
    if(isset($_POST['name']) && !empty($_POST['name']) && isset($_POST['mail']) && !empty($_POST['mail']) && isset($_POST['consulta']) && !empty($_POST['consulta'])){
      $consulta["nombre"] = $_POST['name'];
      $consulta["mail"] = $_POST['mail'];
      $consulta["consulta"] = $_POST['consulta'];
      $consulta["notificacion"] = isset($_POST['notificacion']);
      $this->model->agregarConsulta($consulta);
    }
    $this->view->mostrarFormulario();
  }


  function mostrar_consultas(){
    $consultas = $this->model->getConsultas();
    $this->view->mostrarConsultas($consultas);
  }
  function eliminar_consulta(){
    if(isset($_GET['id']) && !empty($_GET["id"])){
      $key = $_GET['id'];
      $this->model->eliminarConsulta($key);
    }
    $this->mostrar_consultas();
  }
}

 ?>
