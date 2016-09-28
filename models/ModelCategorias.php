<?php
include_once ("models/db.php");
class ModelCategorias
{
  private $tareas;
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

}

?>
