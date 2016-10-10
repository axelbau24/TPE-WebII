<?php

include '../libs/Smarty.class.php';
$smarty = new Smarty();

if(isset($_POST["host"]) && isset($_POST["user"]) && isset($_POST["db-pw"]) && isset($_POST["dbname"])){

  try {
      $conexionValida = new PDO('mysql:host='.$_POST["host"].';charset=utf8', $_POST["user"], $_POST["db-pw"]);
  } catch (PDOException $e) {
      $conexionValida = false;
  }


  if($conexionValida){
    $config = fopen("config.txt", "w+");
    fwrite($config, $_POST["host"]."#".$_POST["user"]."#".$_POST["db-pw"]."#".$_POST["dbname"]);
    fclose($config);
    $smarty->assign("asignados", true);
    $querys = getSQL("todopc.sql");
    $dbname = $_POST["dbname"];

    if(isset($_POST['vaciar'])) $conexionValida->exec('DROP DATABASE IF EXISTS '.$dbname);
    $conexionValida->exec('CREATE DATABASE IF NOT EXISTS '.$dbname);
    $conexionValida->exec('DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci');
    $conexionValida->exec('USE '.$dbname);

    if(isset($_POST['add'])){
      $i = 0;
      while ($i < count($querys) && strlen($conexionValida->errorInfo()[2]) == 0) {
        $conexionValida->exec($querys[$i]);
        $i++;
      }
      if($i == count($querys)) $smarty->assign("db_correcto", 1);
      else $smarty->assign("db_correcto", $conexionValida->errorInfo()[2]);
    }




  } else $smarty->assign("asignados", false);
  $smarty->display("errores.tpl");

}
else $smarty->display("instalar.tpl");

function getSQL($nombre){
  $querys = fopen($nombre, "r+");
  $sql = "";
  while (!feof($querys)) {
    $linea = fgets($querys);
    $linea = str_replace("'", '"', $linea);
    if(!preg_match('/--/', $linea))   $sql .= $linea;
  }
  fclose($querys);
  $querys = explode(";", $sql);
  unset($querys[count($querys)-1]);
  return $querys;
}

 ?>
