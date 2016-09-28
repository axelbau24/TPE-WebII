<?php
include_once ("models/db.php");
class ModelContacto
{
  private $db;

  function __construct()
  {
    $this->db = new Database();
  }

  function agregarConsulta($nombre,$mail,$consulta,$notificacion){
    $query = $this->db->getDB()->prepare("insert into consulta(nombre, mail, consulta, notificacion) values (?,?,?,?)");
    $query->execute(array("$nombre","$mail","$consulta","$notificacion"));

  }

}

?>
