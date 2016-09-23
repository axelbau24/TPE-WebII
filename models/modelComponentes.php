<?php
include ("models/db.php");
class ModelComponentes
{
  private $db;
  function __construct()
  {
    $this->db = new Database();
  }

  function getComponentes()
  {
    $componentes = $this->db->getDB()->prepare("SELECT * FROM componente");
    $componentes->execute();
    return $componentes->fetchAll(PDO::FETCH_ASSOC);
  }

  function getComponentesByCategoria($id_categoria)
  {
    $componentes = $this->db->getDB()->prepare("SELECT * FROM componente WHERE fk_id_categoria = ?");
    $componentes->execute(array($id_categoria));
    return $componentes->fetchAll(PDO::FETCH_ASSOC);
  }
}

 ?>
