<?php
require 'api.php';
include_once("../models/ModelComentarios.php");

class ComentariosApi extends Api
{
  private $model;

  public function __construct($request)
 {
    parent::__construct($request);
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
          if(count($argumentos)>0){
            $error['Error'] = "El comentario no existe";
            $success['Success'] = "El comentario se borro exitosamente";
            $filasAfectadas = $this->model->eliminarComentario($argumentos[0]);
            return ($filasAfectadas == 1) ? $success : $error;
          }
        break;
        case 'POST':
            if(count($argumentos)==0){
              $error['Error'] = "El comentario no se creo";
              $id_comentario = $this->model->crearComentario($_POST['id_componente'],$_POST['id_usuario'],$_POST['comentario'],$_POST['puntaje']);
              return ($id_comentario > 0) ? $this->model->getComentario($id_comentario) : $error;
            }
          break;
      default:
           return "Método no válido";
        break;
    }
   }

}


 ?>
