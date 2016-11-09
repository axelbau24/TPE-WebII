<?php
class ModelUsuarios extends Model{

  function getPermisos($user){
    $permisos = $this->db->prepare(
    "SELECT
      accion.id_accion,
      accion.nombre,
      accion.accion AS accion_denegada
    FROM
      usuario,
      accion,
      permiso
    WHERE
      permiso.fk_id_rango = usuario.fk_id_rango AND permiso.fk_id_accion = accion.id_accion AND usuario.nombre = 'axelbau24'");
    $permisos->execute(array($user));
    return $permisos->fetchAll(PDO::FETCH_ASSOC);
  }



// Obtengo los grupos que un usuario puede administrar
/*SELECT DISTINCT grupo_acciones.* FROM grupo_acciones, usuario, accion, permiso WHERE usuario.nombre = 'axelbau24' AND id_grupo_a NOT IN(SELECT DISTINCT grupo_acciones.id_grupo_a FROM grupo_acciones, usuario, accion, permiso WHERE grupo_acciones.id_grupo_a = accion.fk_id_grupo_a AND permiso.fk_id_rango = usuario.fk_id_rango AND permiso.fk_id_accion = accion.id_accion AND usuario.nombre = 'axelbau24')*/

/*SELECT DISTINCT
     grupo_acciones.*
    FROM
      grupo_acciones,
      usuario,
      accion,
      permiso
    WHERE grupo_acciones.id_grupo_a = accion.fk_id_grupo_a AND
      permiso.fk_id_rango = usuario.fk_id_rango AND permiso.fk_id_accion = accion.id_accion AND usuario.nombre = 'axelbau24'*/
// Si ese rango no tiene ningun permiso denegado, debe estar en todos los grupos
  function getPermisosVisitante(){
    $permisos = $this->db->prepare(
    "SELECT
      accion.id_accion,
      accion.nombre,
      accion.accion AS accion_denegada
    FROM
      permiso,
      accion,
      rango
    WHERE
      permiso.fk_id_rango = rango.id_rango AND accion.id_accion = permiso.fk_id_accion AND rango.nombre = 'Visitante'");
    $permisos->execute();
    return $permisos->fetchAll(PDO::FETCH_ASSOC);
  }

  function getUsuario($nickname){
    $permisos = $this->db->prepare("SELECT * FROM usuario WHERE nombre = ?");
    $permisos->execute(array($nickname));
    return $permisos->fetch(PDO::FETCH_ASSOC);
  }
  function getGrupos($nickname){
    $grupos = $this->db->prepare("SELECT DISTINCT
      grupo_acciones.*
    FROM
      grupo_acciones,
      usuario,
      accion,
      permiso
    WHERE
      usuario.nombre = ? AND id_grupo_a NOT IN(
      SELECT DISTINCT
        grupo_acciones.id_grupo_a
      FROM
        grupo_acciones,
        usuario,
        accion,
        permiso
      WHERE
        grupo_acciones.id_grupo_a = accion.fk_id_grupo_a AND
        permiso.fk_id_rango = usuario.fk_id_rango AND
        permiso.fk_id_accion = accion.id_accion AND
        usuario.nombre = ?)");
    $grupos->execute(array($nickname, $nickname));
    return $grupos->fetchAll(PDO::FETCH_ASSOC);
  }




}



 ?>
