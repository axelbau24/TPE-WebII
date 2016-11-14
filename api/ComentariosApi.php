<?php
require 'api.php';
include_once("models/ModelComentarios.php");
class ComentariosApi extends Api
{
  private $model;

  public function __construct($request)
 {
    parent::__construct($request);
    $this->model = new ModelComentarios();
  }

  protected function comentarios($argumentos){
    switch ($this->method) {
      case 'GET':
          if(count($argumentos)>0){
            $tarea = $this->model->getComentario($argumentos[0]);
            $error['Error'] = "Ese contacto no existe";
            return ($tarea) ? $tarea : $error;
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
           return "Only accepts GET";
        break;
    }
   }



}


 ?>
