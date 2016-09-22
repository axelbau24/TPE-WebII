<?php
include_once("view/ViewComponentes.php");

class ComponentesController
{
  private $vista;
  function __construct()
  {
    $this->vista = new ViewComponentes();
  }

  function mostrar()
  {
    $this->vista->mostrarComponentes();
  }
}

 ?>
