<?php

class Config{

 function getConfig(){
    $config = fopen("db/config.txt", "r");
    return explode("#", fgets($config));
  }


}

 ?>
                                                                                                                                                                                                                                                                                                                                
