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
}

 ?>
