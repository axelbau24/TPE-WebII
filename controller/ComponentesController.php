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
    $componentes = $this->model->getComponentes();
    $this->vista->mostrarComponentes($componentes, $categorias);

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
