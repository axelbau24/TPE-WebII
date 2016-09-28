<?php
require_once('view/ViewContacto.php');
require_once('models/ModelContacto.php');

class ContactoController
{
  private $vista;
  private $modelo;

  function __construct()
  {
    $this->modelo = new ModelContacto();
    $this->vista = new ViewContacto();
  }

  function agregar(){
    print_r ($_POST);
    $name = $_POST['name'];
    $mail = $_POST['mail'];
    $consulta = $_POST['consulta'];
    $notificacion = isset($_POST['notificacion']);
    $this->modelo->agregarConsulta($name,$mail,$consulta,$notificacion);
    $this->mostrarFormulario();
  }

  function mostrarFormulario(){
    $this->vista->mostrarFormulario();
  }
}

 ?>
