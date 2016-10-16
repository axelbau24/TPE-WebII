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

  function mostrar_categorias(){
    $this->vista->mostrar($this->modelo->getCategorias());
  }
  function listar(){
    $this->vista->mostrarLista($this->modelo->getCategorias());
  }

  function eliminar_categoria(){
    $key = $_GET['id'];
    $this->modelo->eliminarCategoria($key);
    $this->listar();
}
  function agregar_categoria(){
    $name = $_POST['nombre'];
    $this->modelo->agregarCategoria($name);
    $this->listar();
  }
  function editar_categoria(){
    $key = $_GET['id'];
    $newName = $_POST['nuevo-nombre'];
    $this->modelo->editarCategoria($newName,$key);
    $this->listar();
  }

}

 ?>
