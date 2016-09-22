<?php
require ('config/ConfigApp.php');
require ('controller/ComponentesController.php');

$controllerComponentes = new ComponentesController();

if (!array_key_exists(ConfigApp::$ACTION,$_REQUEST)){
  $controllerComponentes->mostrar();
  die();
}

switch ($_REQUEST[ConfigApp::$ACTION]) {
  case ConfigApp::$ACTION_MOSTRAR_COMPONENTES:
    $controller->mostrar();
    break;
  default:
  $controllerComponentes->mostrar();
    break;
}

 ?>
