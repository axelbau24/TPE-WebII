<?php
include_once("view/ViewComponentes.php");
include_once("models/ModelComponentes.php");
//include_once("models/ModelCategorias.php");

class ComponentesController
{
  private $vista;
  private $model;
  function __construct()
  {
    $this->vista = new ViewComponentes();
    $this->model = new ModelComponentes();
  }

  function mostrar()
  {
    $componentes = $this->model->getComponentes();
    $this->vista->mostrarComponentes($componentes);
  }
}

 ?>
