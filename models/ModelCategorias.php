<?php
include_once ("models/db.php");
class ModelCategorias
{
  private $db;

  function __construct()
  {
    $this->db = new Database();
  }
  function getCategorias(){
    $sentencia = $this->db->getDB()->prepare( "select * from categoria");
    $sentencia->execute();
    $categorias = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    foreach ($categorias as $key => $categoria) {
      $categorias[$key]["cantidad"] = $this->getCantidadCategoria($categoria["id_categoria"]);
    }
    return $categorias;
  }
  function getCategoria($id_categoria){
    $sentencia = $this->db->getDB()->prepare( "select * from categoria WHERE id_categoria = ?");
    $sentencia->execute(array($id_categoria));
    $categoria = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    return $categoria;
  }

  function getCantidadCategoria($id_categoria)
  {
    $cantidad = $this->db->getDB()->prepare( "SELECT COUNT(*) AS cantidad FROM componente WHERE fk_id_categoria = ?");
    $cantidad->execute(array($id_categoria));
    $cantidad = $cantidad->fetch(PDO::FETCH_NUM)[0];
    return $cantidad;
  }


  function eliminarCategoria($id_categoria){

    $sentencia = $this->db->getDB()->prepare("delete from categoria where id_categoria=?");
    $sentencia->execute(array($id_categoria));
  }
  function agregarCategoria($nombre){
    $categoria = $this->db->getDB()->prepare("insert into categoria(nombre) values(?)");
    $categoria->execute(array($nombre));
  }
  function editarCategoria($newName,$id_categoria){
    $categoria = $this->db->getDB()->prepare("update categoria SET nombre=? where id_categoria=?");
    $categoria->execute(array($newName,$id_categoria));
  }

}

?>
