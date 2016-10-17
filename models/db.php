<?php
include_once 'db/config.php';
class Database
{
  protected $db;
  function __construct() {
    $config = new Config();
    $config = $config->getConfig();
    try {
      $this->db = new PDO('mysql:host='.$config[0].';dbname='.rtrim($config[3]).';charset=utf8', $config[1], $config[2]);
    } catch (PDOException $e) {
        header('Location: db');
        die();
    }


  }

}

 ?>
