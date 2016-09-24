<?php
require ('config/ConfigApp.php');
require ('controller/ComponentesController.php');
require ('controller/CategoriasController.php');

$controllerComponentes = new ComponentesController();
$controllerCategorias = new CategoriasController();

if (!array_key_exists(ConfigApp::$ACTION,$_REQUEST)){
  $controllerComponentes->mostrar();
  die();
}

switch ($_REQUEST[ConfigApp::$ACTION]) {
  case ConfigApp::$ACTION_MOSTRAR_COMPONENTE:
    $controllerComponentes->mostrarComponente($_GET["id"]);
    break;
  case ConfigApp::$ACTION_MOSTRAR_CATEGORIAS:
    $controllerCategorias->mostrar();
    break;
  default:
    $controllerComponentes->mostrar();
    break;
}

 ?>
