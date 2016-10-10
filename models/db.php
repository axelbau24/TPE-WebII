<?php
include_once 'db/config.php';
class Database
{
  private $db;
  function __construct() {
    $config = new Config();
    $config = $config->getConfig();
    $this->db = new PDO('mysql:host='.$config[0].';dbname='.rtrim($config[3]).';charset=utf8', $config[1], $config[2]);
}

  function getDB(){
    return $this->db;
  }

}

 ?>
