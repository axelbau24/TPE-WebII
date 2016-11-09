<?php

define("SQLFILE", "todopc.sql");

include '../libs/Smarty.class.php';
$smarty = new Smarty();

if(isset($_POST["host"]) && isset($_POST["user"]) && isset($_POST["db-pw"]) && isset($_POST["dbname"])){

  try {
      $conexionValida = new PDO('mysql:host='.$_POST["host"].';charset=utf8', $_POST["user"], $_POST["db-pw"]);
  } catch (PDOException $e) {
      $conexionValida = false;
  }

  if($conexionValida){
    $configFile = "config.php";
    $archivo = file($configFile);
    $archivo[2] = changeValue($archivo[2], $_POST["host"]);
    $archivo[3] = changeValue($archivo[3], $_POST["user"]);
    $archivo[4] = changeValue($archivo[4], $_POST["db-pw"]);
    $archivo[5] = changeValue($archivo[5], $_POST["dbname"]);
    file_put_contents($configFile, $archivo);

    $smarty->assign("asignados", true);
    $querys = getSQL(SQLFILE);
    $dbname = $_POST["dbname"];

    if(isset($_POST['vaciar'])) $conexionValida->exec('DROP DATABASE IF EXISTS '.$dbname);
    $conexionValida->exec('CREATE DATABASE IF NOT EXISTS '.$dbname);
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

function changeValue($variable, $value){
  $start = '';
  $end = '");';
  $i = 0;
  while ($i < strlen($variable) && !strpos($start, ', "')) {
    $start .= $variable[$i];
    $i++;
  }
  $newVar = $start.$value.$end.PHP_EOL;
  return $newVar;
}

 ?>
