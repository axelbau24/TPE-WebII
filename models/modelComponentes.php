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
    $this->db->getDB()->prepare("SELECT * FROM componente");
    $this->db->getDB()->execute();
    return $this->db->getDB()->fetchAll(PDO::FETCH_ASSOC);
  }
}

 ?>
