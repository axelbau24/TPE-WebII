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

  function mostrar()
  {
    $categorias = $this->modelCategorias->getCategorias();
    $componentes = [];
  /* Otra posible solución
    foreach ($categorias as $key => $categoria) {
      $categorias[$key]["componentes"] = [];
      foreach ($componentes as $componente) {
        if($componente["fk_id_categoria"] == $categoria["id_categoria"]){
          array_push($categorias[$key]["componentes"], $componente);
        }
      }
    }*/
    foreach ($categorias as $categoria) {
      $componentes[$categoria["nombre"]] = $this->model->getComponentesByCategoria($categoria["id_categoria"]);
    }

    $this->vista->mostrarComponentes($componentes);

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
}

 ?>
