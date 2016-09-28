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
  case ConfigApp::$ACTION_ELIMINAR_CATEGORIA:
    $controllerCategorias->eliminar();
    break;
  case ConfigApp::$ACTION_AGREGAR_CATEGORIA:
    $controllerCategorias->agregar();
    break;
  case ConfigApp::$ACTION_EDITAR_CATEGORIA:
    $controllerCategorias->editar();
    break;
  default:
    $controllerComponentes->mostrar();
    break;
}

 ?>
