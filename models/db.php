<?php

class Database
{
  private $db;
  function __construct()
  {
    $this->db = new PDO('mysql:host=localhost;dbname=todopc;charset=utf8', 'root', '')
  }
  function getDB()
  {
    return $this->db;
  }
}

 ?>
