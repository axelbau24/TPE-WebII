<?php
include_once ("Model.php");

class ModelComentarios extends Model{

function getComentarios(){
  $comentarios = $this->db->prepare("SELECT comentario.*, usuario.nombre AS usuario FROM comentario, usuario WHERE comentario.fk_id_usuario = usuario.id_usuario" );
  $comentarios->execute();
  return $comentarios->fetchAll(PDO::FETCH_ASSOC);
}

function getComentario($id_comentario){
  $comentario = $this->db->prepare("SELECT comentario.*, usuario.nombre AS usuario FROM comentario, usuario WHERE comentario.fk_id_usuario = usuario.id_usuario AND  id_comentario = ?" );
  $comentario->execute(array($id_comentario));
  return $comentario->fetch(PDO::FETCH_ASSOC);
}

function eliminarComentario($id_comentario){
  $sentencia = $this->db->prepare("delete from comentario where id_comentario=?");
  $sentencia->execute(array($id_comentario));
  return $sentencia->rowCount();
}
function crearComentario($id_componente, $id_usuario,$comentario,$puntaje){
  $sentencia = $this->db->prepare("INSERT INTO comentario(fk_id_componente,fk_id_usuario,comentario,puntaje) values(?,?,?,?)");
    $sentencia->execute(array($id_componente, $id_usuario,$comentario,$puntaje));
    return $this->db->lastInsertId();
}

}
?>
