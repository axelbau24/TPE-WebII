<?php
include_once ("models/Model.php");
class ModelRoles extends Model{

  function getRoles(){
    $roles = $this->db->prepare("SELECT * FROM rol");
    $roles->execute();
    return $roles->fetchAll(PDO::FETCH_ASSOC);
  }
  function getRol($id){
    $roles = $this->db->prepare("SELECT * FROM rol WHERE id_rol = ?");
    $roles->execute(array($id));
    return $roles->fetch(PDO::FETCH_ASSOC);
  }
  function getCantUsuariosEnRol($id){
    $cantidad = $this->db->prepare("SELECT COUNT(*) FROM usuario WHERE usuario.fk_id_rol = ?");
    $cantidad->execute(array($id));
    return $cantidad->fetch(PDO::FETCH_NUM)[0];
  }

  function getActions(){
    $permisos = $this->db->prepare("SELECT * FROM accion");
    $permisos->execute();
    return $permisos->fetchAll(PDO::FETCH_ASSOC);
  }
  function getPermisos($id_rol){
    $permisos = $this->db->prepare("SELECT * FROM permiso WHERE fk_id_rol = ?");
    $permisos->execute(array($id_rol));
    return $permisos->fetchAll(PDO::FETCH_COLUMN, 1);
  }
  function addPermiso($idRol, $action){
    $permisos = $this->db->prepare("INSERT INTO permiso(fk_id_accion,fk_id_rol) VALUES(?,?)");
    $permisos->execute(array($action, $idRol));
  }
  function eliminarPermiso($idRol, $action){
    $permiso = $this->db->prepare("DELETE FROM permiso WHERE fk_id_accion=? AND fk_id_rol = ?");
    $permiso->execute(array($action, $idRol));
  }

  function eliminarRol($id){
    $sentencia = $this->db->prepare("DELETE FROM rol WHERE id_rol=?");
    $sentencia->execute(array($id));
  }

  function agregarRol($nombre){
    $rol = $this->db->prepare("INSERT INTO rol(nombre) VALUES(?)");
    $rol->execute(array($nombre));
    return $this->getRol($this->db->lastInsertId());
  }
}

 ?>
