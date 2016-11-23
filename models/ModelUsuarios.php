<?php
include_once (dirname(__DIR__). "/models/Model.php");
class ModelUsuarios extends Model{

  // Esta funcion devuelve los permisos que el usuario NO puede hacer
  function getPermisosUsuario($user){
    $permisos = $this->db->prepare(
    "SELECT
      accion.accion AS accion_denegada
    FROM
      usuario,
      accion,
      permiso
    WHERE
      permiso.fk_id_rol = usuario.fk_id_rol AND permiso.fk_id_accion = accion.id_accion AND usuario.id_usuario = ?");
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
    $usuarios = $this->db->prepare("SELECT usuario.*, rol.nombre AS rol FROM rol, usuario WHERE usuario.fk_id_rol = rol.id_rol ORDER BY usuario.fk_id_rol ASC");
    $usuarios->execute();
    return $usuarios->fetchAll(PDO::FETCH_ASSOC);
  }
  function getUsuario($nickname){
    $usuario = $this->db->prepare("SELECT usuario.*, rol.nombre AS rol FROM rol, usuario WHERE usuario.fk_id_rol = rol.id_rol AND usuario.nombre = ? OR usuario.email = ? GROUP BY usuario.id_usuario");
    $usuario->execute(array($nickname, $nickname));
    return $usuario->fetch(PDO::FETCH_ASSOC);
  }
  function getUsuarioById($id){
    $usuario = $this->db->prepare("SELECT * FROM usuario WHERE id_usuario = ?");
    $usuario->execute(array($id));
    return $usuario->fetch(PDO::FETCH_ASSOC);
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
    $sentencia = $this->db->prepare("DELETE FROM usuario WHERE id_usuario=?");
    $sentencia->execute(array($id_usuario));
  }
  function editarUsuario($usuario){
    $sentencia = $this->db->prepare("UPDATE usuario set nombre=? , email=?, fk_id_rol=? where id_usuario=?");
    $sentencia->execute(array($usuario["username"], $usuario["email"], $usuario["id_rol"], $usuario["id_usuario"]));
  }
  function editarDatos($usuario){
    $sentencia = $this->db->prepare("UPDATE usuario set password=? , email=?, avatar=? where id_usuario=?");
    $sentencia->execute(array($usuario["password"] , $usuario["email"], $usuario["avatar"], $usuario["id_usuario"]));
  }

}

 ?>
