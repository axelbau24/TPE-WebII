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
  function mostrar()
  {
    $consultas = $this->modelo->getConsultas();
    $this->vista->mostrarConsultas($consultas);
  }
  function eliminarConsulta(){
    $key = $_GET['id'];
    $this->modelo->eliminarConsulta($key);
    $this->vista->listarConsultas($this->modelo->getConsultas());
}
}

 ?>
