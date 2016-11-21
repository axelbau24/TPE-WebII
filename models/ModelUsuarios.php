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
    $usuarios = $this->db->prepare("SELECT usuario.*, rol.nombre AS rol FROM rol, usuario WHERE usuario.fk_id_rol = rol.id_rol ORDER BY usuario.fk_id_rol ASC");
    $usuarios->execute();
    return $usuarios->fetchAll(PDO::FETCH_ASSOC);
  }
  function getUsuario($nickname){
    $permisos = $this->db->prepare("SELECT usuario.*, rol.nombre AS rol FROM rol, usuario WHERE usuario.fk_id_rol = rol.id_rol AND usuario.nombre = ? OR usuario.email = ? GROUP BY usuario.id_usuario");
    $permisos->execute(array($nickname, $nickname));
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


  function eliminarUsuario($id_usuario){
    $sentencia = $this->db->prepare("DELETE FROM usuario WHERE id_usuario=?");
    $sentencia->execute(array($id_usuario));
  }

  function editarUsuario($usuario){
    $sentencia = $this->db->prepare("UPDATE usuario set nombre=? , email=?, fk_id_rol=? where id_usuario=?");
    $sentencia->execute(array($usuario["username"], $usuario["email"], $usuario["id_rol"], $usuario["id_usuario"]));
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
