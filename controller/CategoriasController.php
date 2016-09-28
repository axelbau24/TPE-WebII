<?php
require_once('view/ViewCategorias.php');
require_once('models/ModelCategorias.php');

class CategoriasController
{
  private $vista;
  private $modelo;

  function __construct()
  {
    $this->modelo = new ModelCategorias();
    $this->vista = new ViewCategorias();
  }

  function mostrar(){
    $this->vista->mostrar($this->modelo->getCategorias());
  }

  function eliminar(){
    $key = $_GET['id'];
    $this->modelo->eliminarCategoria($key);
    $this->mostrar();
}
  function agregar(){
    $name = $_POST['nombre'];
    $this->modelo->agregarCategoria($name);
    $this->mostrar();
  }
  function editar(){
    $key = $_GET['id'];
    $newName = $_POST['nuevo-nombre'];
    $this->modelo->editarCategoria($newName,$key);
    $this->mostrar();
  }

}

 ?>
