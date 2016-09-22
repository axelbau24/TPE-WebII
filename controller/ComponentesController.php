<?php
include_once("view/ViewComponentes.php");
include_once("view/ModelComponentes.php");

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
    
    $this->vista->mostrarComponentes();
  }
}

 ?>
