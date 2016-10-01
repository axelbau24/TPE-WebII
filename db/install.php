<?php

include '../libs/Smarty.class.php';
$smarty = new Smarty();

if(count($_REQUEST) > 0){
try {

  $conexionValida = @mysql_connect($_POST["host"], $_POST["user"], $_POST["db-pw"]);
  if($conexionValida){
    $config = fopen("config.txt", "w+");
    fwrite($config, $_POST["host"]."#".$_POST["user"]."#".$_POST["db-pw"]."#".$_POST["dbname"]);
    fclose($config);
    $smarty->assign("asignados", true);
    $querys = getSQL();
    $dbname = $_POST["dbname"];
    mysql_query('CREATE DATABASE IF NOT EXISTS '.$dbname);
    mysql_query('DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci');
    mysql_query('USE '.$dbname);

    if(isset($_POST['add'])){
      $i = 0;
      while ($i < count(getSQL()) && mysql_query($querys[$i])) $i++;
      if($i == count(getSQL())) $smarty->assign("db_correcto", 1);
      else $smarty->assign("db_correcto", mysql_error());
    }

    mysql_close($conexionValida);
  } else $smarty->assign("asignados", false);
} catch (Exception $e) {
  echo "error";
}


}


function getSQL(){
  $querys = fopen("todopc.sql", "r+");
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

$smarty->display("instalar.tpl");

 ?>
