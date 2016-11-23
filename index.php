<?php
require ('config/ConfigApp.php');
require ('controller/ComponentesController.php');
require ('controller/CategoriasController.php');
require ('controller/ContactoController.php');
require ('controller/UsuariosController.php');
require ('controller/RolesController.php');

$c_usuarios = new UsuariosController();
$c_componentes = new ComponentesController();
$c_categorias = new CategoriasController();
$c_contacto = new ContactoController();
$c_roles = new RolesController();

$controllers = ['Componentes' =>  $c_componentes, 'Categorias' =>  $c_categorias, 'Contacto' =>  $c_contacto, 'Usuarios' =>  $c_usuarios, 'Roles' =>  $c_roles];

if (array_key_exists(ConfigApp::$ACTION,$_REQUEST) && array_key_exists($_REQUEST[ConfigApp::$ACTION], ConfigApp::$ACTIONS)){
    $action = $_REQUEST[ConfigApp::$ACTION];
    $nombreController = ConfigApp::$ACTIONS[$action];
    if($c_usuarios->autorizado($action)) $controllers[$nombreController]->{$action}();
} else $c_componentes->iniciar();
 ?>
