<?php
require_once('view/ViewCategorias.php');
require_once('models/ModelCategorias.php');
include_once("controller/Controller.php");

class CategoriasController extends Controller{

  function __construct(){
    parent::__construct();
    $this->modelo = new ModelCategorias();
    $this->view = new ViewCategorias();
  }

  function admin_categorias(){
    $this->asignarPermisos();
    $this->view->mostrar($this->modelo->getCategorias());
  }


  function eliminar_categoria(){
    if(isset($_GET['id']) && !empty($_GET['id'])){
    $key = $_GET['id'];
    $this->modelo->eliminarCategoria($key);
    }
    $this->admin_categorias();
}
  function agregar_categoria(){
    if(isset($_POST['nombre']) && !empty($_POST['nombre'])){
    $name = $_POST['nombre'];
    $this->modelo->agregarCategoria($name);
    }
    $this->admin_categorias();
  }
  function editar_categoria(){
    if(isset($_GET['id']) && isset($_POST['nuevo-nombre']) && !empty($_POST['nuevo-nombre'])  && !empty($_GET['id']) ){
    $key = $_GET['id'];
    $newName = $_POST['nuevo-nombre'];
    $this->modelo->editarCategoria($newName,$key);
    }
    $this->admin_categorias();
  }

}

 ?>
