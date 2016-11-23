<?php
require 'api.php';
include_once("../models/ModelComentarios.php");
include_once("../controller/UsuariosController.php");

define('ACTION_ELIMINAR', 'eliminar_comentario');
define('ACTION_AGREGAR', 'agregar_comentario');
define('ERROR_AUTORIZACION', 'Usuario no autorizado');

class ComentariosApi extends Api
{
  private $model;
  private $controller_usuarios;

  public function __construct($request)
 {
    parent::__construct($request);
    $this->controller_usuarios = new UsuariosController();
    $this->model = new ModelComentarios();
  }

  public function comentarios($argumentos){
    switch ($this->method) {
      case 'GET':
          if(count($argumentos)>0){
            $comentario = $this->model->getComentario($argumentos[0]);
            $error['Error'] = "Ese comentario no existe";
            return ($comentario) ? $comentario : $error;
          }else{
            return $this->model->getComentarios();
          }
        break;
      case 'DELETE':
          if($this->controller_usuarios->autorizado(ACTION_ELIMINAR) && count($argumentos) > 0){
            $error['Error'] = "El comentario no existe";
            $success['Success'] = "El comentario se borro exitosamente";
            $filasAfectadas = $this->model->eliminarComentario($argumentos[0]);
            return ($filasAfectadas == 1) ? $success : $error;
          } return ERROR_AUTORIZACION;
        break;
        case 'POST':
            if($this->controller_usuarios->autorizado(ACTION_AGREGAR) && count($argumentos) == 0
            && isset($_POST['id_componente']) && isset($_POST['id_usuario']) && isset($_POST['comentario']) && isset($_POST['puntaje'])
            && !empty($_POST['id_componente']) && !empty($_POST['id_usuario']) && !empty($_POST['comentario']) && !empty($_POST['puntaje'])){
              $error['Error'] = "El comentario no se creo";
              $id_comentario = $this->model->crearComentario($_POST['id_componente'],$_POST['id_usuario'],$_POST['comentario'],$_POST['puntaje']);
              return ($id_comentario > 0) ? $this->model->getComentario($id_comentario) : $error;
            } return ERROR_AUTORIZACION;
          break;
      default:
           return "Método no válido";
        break;
    }
   }

}


 ?>
