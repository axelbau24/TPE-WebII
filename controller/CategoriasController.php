<?php
require_once('view/ViewCategorias.php');
require_once('models/ModelCategorias.php');
require_once('models/ModelUsuarios.php');

class CategoriasController
{
  private $vista;
  private $modelo;
  private $modelUsuario;

  function __construct()
  {
    $this->modelUsuario = new ModelUsuarios();
    $this->modelo = new ModelCategorias();
    $this->vista = new ViewCategorias();
  }

  function mostrar_categorias(){
    $permisos = $this->modelUsuario->getPermisos($_SESSION["user"]);
    $this->vista->actualizarPermisos($permisos);
    $this->vista->mostrar($this->modelo->getCategorias());
  }


  function eliminar_categoria(){
    if(isset($_GET['id'])){
    $key = $_GET['id'];
    $this->modelo->eliminarCategoria($key);
    }
    $this->mostrar_categorias();
}
  function agregar_categoria(){
    if(isset($_POST['nombre'])){
    $name = $_POST['nombre'];
    $this->modelo->agregarCategoria($name);
    }
    $this->mostrar_categorias();
  }
  function editar_categoria(){
    if(isset($_GET['id'])){
    $key = $_GET['id'];
    $newName = $_POST['nuevo-nombre'];
    $this->modelo->editarCategoria($newName,$key);
    }
    $this->mostrar_categorias();
  }

}

 ?>
