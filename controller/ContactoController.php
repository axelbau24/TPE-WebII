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

  function agregar_consulta(){
    $name = $_POST['name'];
    $mail = $_POST['mail'];
    $consulta = $_POST['consulta'];
    $notificacion = isset($_POST['notificacion']);
    $this->modelo->agregarConsulta($name,$mail,$consulta,$notificacion);
    $this->mostrar_formulario_consulta();
  }

  function mostrar_formulario_consulta(){
    $this->vista->mostrarFormulario();
  }
  function mostrar_consultas()
  {
    $consultas = $this->modelo->getConsultas();
    $this->vista->mostrarConsultas($consultas);
  }
  function eliminar_consulta(){
    $key = $_GET['id'];
    $this->modelo->eliminarConsulta($key);
    $this->vista->listarConsultas($this->modelo->getConsultas());
}
}

 ?>
