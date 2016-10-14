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

  function mostrarInicio()//esto se debe llamar mostrar
  {
    $categorias = $this->modelCategorias->getCategorias();
    $componentes = $this->model->getComponentes();
    $this->vista->mostrarComponentes($componentes, $categorias);
  }

  function mostrar_componentes(){

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

  function mostrar_componente() {
    $id_componente = $_GET["id"];
    $categoria = $this->model->getCategoriaComponente($id_componente);
    $componente = $this->model->getComponentes();
    $imagenes = $this->model->getImagenes($id_componente);
    foreach ($componente as $comp) {
      if($comp["id_componente"] == $id_componente) $componente = $comp;
    }
    $componente["imagenes"] = $imagenes;

    $this->vista->mostrarComponente($categoria, $componente);
  }
  function eliminar_componente(){
    $key = $_GET['id'];
    $this->modelo->eliminarComponente($key);
    $this->mostrar_componentes();
  }

  function agregar_componente(){
    $name = $_POST['nombre'];
    $destacado = $_POST['destacado'];
    $categoria = $_POST['categoria'];
    $this->modelo->agregarComponente($name,$destacado,$categoria);
    $this->mostrar_componentes();
  }

  function editar_componente(){
    $key = $_GET['id'];
    $newNombre = $_POST['nuevo-nombre'];
    $newDestacado = isset($_POST['nuevo-recomendado']);
    $newCategoria = $_POST['nueva-categoria'];
    $this->model->editarComponente($newNombre,$newDestacado,$newCategoria,$key);
    $this->mostrar_componentes();
  }
}

 ?>
