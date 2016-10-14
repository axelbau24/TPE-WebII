<?php
require ('config/ConfigApp.php');
require ('controller/ComponentesController.php');
require ('controller/CategoriasController.php');
require ('controller/ContactoController.php');

$controllerComponentes = new ComponentesController();
$controllerCategorias = new CategoriasController();
$controllerContacto = new ContactoController();

if (array_key_exists(ConfigApp::$ACTION,$_REQUEST) && array_key_exists($_REQUEST[ConfigApp::$ACTION], ConfigApp::$ACTIONS)){
    $action = $_REQUEST[ConfigApp::$ACTION];
    $controller = ConfigApp::$ACTIONS[$action];
    switch ($controller) {
      case 'Contacto':
        $controllerContacto->{$action}();
        break;
      case 'Categorias':
        $controllerCategorias->{$action}();
        break;
      case 'Componentes':
        $controllerComponentes->{$action}();
        break;
    }
} else $controllerComponentes->mostrarInicio();

 ?>
