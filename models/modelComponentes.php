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

  function getCategoriaComponente($id_componente)
  {
    $componente = $this->db->getDB()->prepare("SELECT categoria.nombre FROM categoria, componente WHERE componente.id_componente = ? AND categoria.id_categoria = componente.fk_id_categoria");
    $componente->execute(array($id_componente));
    return $componente->fetch(PDO::FETCH_NUM)[0];
  }

  function getImagenes($id_componente)
  {
    $imagenes = $this->db->getDB()->prepare("SELECT ruta, id_imagen FROM imagen WHERE fk_id_componente = ?");
    $imagenes->execute(array($id_componente));
    return $imagenes->fetchAll(PDO::FETCH_ASSOC);
  }
}

 ?>
