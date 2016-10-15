<?php
include ("models/db.php");
class ModelComponentes extends Database{

  function __construct() {
    parent::__construct();
  }

  function getComponentes()
  {
    $componentes = $this->db->prepare("SELECT * FROM componente");
    $componentes->execute();
    return $componentes->fetchAll(PDO::FETCH_ASSOC);
  }

  function getComponentesByCategoria($id_categoria)
  {
    $componentes = $this->db->prepare("SELECT * FROM componente WHERE fk_id_categoria = ?");
    $componentes->execute(array($id_categoria));
    return $componentes->fetchAll(PDO::FETCH_ASSOC);
  }

  function getCategoriaComponente($id_componente)
  {
    $componente = $this->db->prepare("SELECT categoria.nombre FROM categoria, componente WHERE componente.id_componente = ? AND categoria.id_categoria = componente.fk_id_categoria");
    $componente->execute(array($id_componente));
    return $componente->fetch(PDO::FETCH_NUM)[0];
  }

  function getImagenes($id_componente)
  {
    $imagenes = $this->db->prepare("SELECT ruta, id_imagen FROM imagen WHERE fk_id_componente = ?");
    $imagenes->execute(array($id_componente));
    return $imagenes->fetchAll(PDO::FETCH_ASSOC);
  }
  function eliminarComponente($id_componente){

    $sentencia = $this->db->prepare("delete from componente where id_componente=?");
    $sentencia->execute(array($id_componente));
  }
  function agregarComponente($nombre){
    $componente = $this->db->prepare("insert into componente(nombre) values(?)");
    $componente->execute(array($nombre));
  }
  function editarComponente($newNombre,$newDestacado,$newCategoria,$key){
    $componente = $this->db->prepare("UPDATE componente SET nombre=?,destacado=?,fk_id_categoria=? WHERE  id_componente=?");
    $componente->execute(array($newNombre,$newDestacado,$newCategoria,$key));
  }
}

 ?>
