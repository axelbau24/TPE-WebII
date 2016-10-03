<?php
include_once("view/ViewComponentes.php");
include_once("models/ModelComponentes.php");
include_once("models/ModelCategorias.php");

class ComponentesController
{
  private $vista;
  private $model;
  private $modelCategorias;
  function __construct()
  {
    $this->vista = new ViewComponentes();
    $this->model = new ModelComponentes();
    $this->modelCategorias = new ModelCategorias();
  }

  function iniciar($filtro)
  {
    $categorias = $this->modelCategorias->getCategorias();
    $componentes = $this->model->getComponentes();
    $this->vista->mostrarComponentes($componentes, $categorias, $filtro);
  }

  function administracion(){

    if(isset($_GET["categoria"])){
      $this->vista->mostrarComponentesCategoria($this->model->getComponentesByCategoria($_GET["categoria"]));
    }
    else {
      $categorias = $this->modelCategorias->getCategorias();
      $componentes = $this->model->getComponentes();
      foreach ($componentes as $key => $componente) {
        $componentes[$key]["imagenes"] = $this->model->getImagenes($componente["id_componente"]);
      }
      $this->vista->mostrarAdmin($componentes, $categorias);
    }
  }

  function mostrarComponente($id_componente)
  {
    $categoria = $this->model->getCategoriaComponente($id_componente);
    $componente = $this->model->getComponentes();
    $imagenes = $this->model->getImagenes($id_componente);
    foreach ($componente as $comp) {
      if($comp["id_componente"] == $id_componente) $componente = $comp;
    }
    $componente["imagenes"] = $imagenes;

    $this->vista->mostrarComponente($categoria, $componente);
  }
  function eliminar(){
    $key = $_GET['id'];
    $this->modelo->eliminarComponente($key);
    $this->iniciar();
  }

  function agregar(){
    $name = $_POST['nombre'];
    $destacado = $_POST['destacado'];
    $categoria = $_POST['categoria'];
    $this->modelo->agregarComponente($name,$destacado,$categoria);
    $this->iniciar();
  }

  function editar(){
    $key = $_GET['id'];
    $newNombre = $_POST['nuevo-nombre'];
    $newDestacado = $_POST['nuevo-destacado'];
    $newCategoria = $_POST['nueva-categoria'];
    //$newFoto = $_POST['nueva-foto'];
    $this->modelo->editarComponente($newName,$newDestacado,$newCategoria,$key);
    $this->iniciar();
  }
  function filtrar()
  {
    if (isset($_GET["id"])) {
    //  $categoria = $this->modelCategorias->getCategoria($_GET["id"]);
    //  $componentes = $this->model->getComponentesByCategoria($_GET["id"]);
      $this->iniciar($_GET["id"]);
    }
  }
}

 ?>
