<?php
include_once ("models/Model.php");
class ModelUsuarios extends Model{

  function getPermisosDenegados($user){
    $permisos = $this->db->prepare(
    "SELECT
      accion.accion AS accion_denegada
    FROM
      usuario,
      accion,
      permiso
    WHERE
      permiso.fk_id_rol = usuario.fk_id_rol AND permiso.fk_id_accion = accion.id_accion AND usuario.nombre = ?");
    $permisos->execute(array($user));
    return $permisos->fetchAll(PDO::FETCH_COLUMN);
  }

  function getPermisosVisitante(){
    $permisos = $this->db->prepare(
    "SELECT
      accion.accion AS accion_denegada
    FROM
      permiso,
      accion,
      rol
    WHERE
      permiso.fk_id_rol = rol.id_rol AND accion.id_accion = permiso.fk_id_accion AND rol.id_rol = 4");
    $permisos->execute();
    return $permisos->fetchAll(PDO::FETCH_COLUMN);
  }

  function getUsuario($nickname){
    $permisos = $this->db->prepare("SELECT * FROM usuario WHERE nombre = ?");
    $permisos->execute(array($nickname));
    return $permisos->fetch(PDO::FETCH_ASSOC);
  }

}

 ?>
