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

  function getUsuarios(){
    $usuarios = $this->db->prepare("SELECT usuario.*, rol.nombre AS rol FROM rol, usuario WHERE usuario.fk_id_rol = rol.id_rol");
    $usuarios->execute();
    return $usuarios->fetchAll(PDO::FETCH_ASSOC);
  }
  function getUsuario($nickname){
    $permisos = $this->db->prepare("SELECT usuario.*, rol.nombre AS rol FROM rol, usuario WHERE usuario.fk_id_rol = rol.id_rol AND usuario.nombre = ?");
    $permisos->execute(array($nickname));
    return $permisos->fetch(PDO::FETCH_ASSOC);
  }
  function crearUsuario($user){

    $usuario = $this->db->prepare("insert into usuario(nombre,email,password,fk_id_rol) values(?,?,?,?) ");
    $usuario->execute(array($user["usuario"],$user["email"],$user["password"],$user["rol"]));
  }
  function getRoles(){
    $roles = $this->db->prepare("SELECT * FROM rol");
    $roles->execute();
    return $roles->fetchAll(PDO::FETCH_ASSOC);
  }
  function eliminarUsuario($id_usuario){
    $sentencia = $this->db->prepare("delete from usuario where id_usuario=?");
    $sentencia->execute(array($id_usuario));
  }

  function editarUsuario($usuario){
    $sentencia = $this->db->prepare("UPDATE usuario set nombre=? , email=?, fk_id_rol=? where id_usuario=?");
    $sentencia->execute($usuario);
  }
  function getPermisos(){
    $permisos = $this->db->prepare("SELECT * FROM accion");
    $permisos->execute();
    return $permisos->fetchAll(PDO::FETCH_ASSOC);
  }
}

 ?>
