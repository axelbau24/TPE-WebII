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
  function getConsultas()
  {
    $consulta = $this->db->getDB()->prepare("SELECT * FROM consulta");
    $consulta->execute();
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
  }
  function eliminarConsulta($id_consulta){

    $sentencia = $this->db->getDB()->prepare("delete from consulta where id_consulta=?");
    $sentencia->execute(array($id_consulta));
  }
}

?>
