<?php
require ('config/ConfigApp.php');
require ('controller/ComponentesController.php');
require ('controller/CategoriasController.php');
require ('controller/ContactoController.php');

$controllerComponentes = new ComponentesController();
$controllerCategorias = new CategoriasController();
$controllerContacto = new ContactoController();

if (!array_key_exists(ConfigApp::$ACTION,$_REQUEST)){
  $controllerComponentes->iniciar(0);
  die();
}

switch ($_REQUEST[ConfigApp::$ACTION]) {
  case ConfigApp::$ACTION_MOSTRAR_COMPONENTE:
    $controllerComponentes->mostrarComponente($_GET["id"]);
    break;
  case ConfigApp::$ACTION_MOSTRAR_COMPONENTES:
    $controllerComponentes->administracion();
    break;
  case ConfigApp::$ACTION_ELIMINAR_COMPONENTE:
    $controllerComponentes->eliminar();
    break;
  case ConfigApp::$ACTION_AGREGAR_COMPONENTE:
    $controllerComponentes->agregar();
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
  case ConfigApp::$ACTION_AGREGAR_CONSULTA:
    $controllerContacto->agregar();
    break;
  case ConfigApp::$ACTION_MOSTRAR_FORMULARIO_CONSULTA:
    $controllerContacto->mostrarFormulario();
    break;
  case ConfigApp::$ACTION_MOSTRAR_CONSULTAS:
    $controllerContacto->mostrar();
    break;
  case ConfigApp::$ACTION_ELIMINAR_CONSULTA:
    $controllerContacto->eliminarConsulta();
    break;
  case ConfigApp::$ACTION_FILTRAR_CATEGORIA:
    $controllerComponentes->filtrar();
    break;
  default:
    $controllerComponentes->iniciar(0);
    break;
}

 ?>
