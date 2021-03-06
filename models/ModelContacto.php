<?php
include_once ("models/Model.php");
class ModelContacto extends Model{

  function __construct() {
    parent::__construct();
  }

  function agregarConsulta($consulta){
    $query = $this->db->prepare("insert into consulta(nombre, mail, consulta, notificacion) values (?,?,?,?)");
    $query->execute(array($consulta["nombre"],$consulta["mail"],$consulta["consulta"],$consulta["notificacion"]));

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
