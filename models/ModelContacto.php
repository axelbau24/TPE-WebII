<?php
include_once ("models/db.php");
class ModelContacto extends Database{

  function __construct() {
    parent::__construct();
  }

  function agregarConsulta($nombre,$mail,$consulta,$notificacion){
    $query = $this->db->prepare("insert into consulta(nombre, mail, consulta, notificacion) values (?,?,?,?)");
    $query->execute(array("$nombre","$mail","$consulta","$notificacion"));

  }
  function getConsultas()
  {
    $consulta = $this->db->prepare("SELECT * FROM consulta");
    $consulta->execute();
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
  }
  function eliminarConsulta($id_consulta){

    $sentencia = $this->db->prepare("delete from consulta where id_consulta=?");
    $sentencia->execute(array($id_consulta));
  }
}

?>
