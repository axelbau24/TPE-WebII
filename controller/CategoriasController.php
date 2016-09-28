<?php
require_once('view/ViewCategorias.php');
require_once('models/ModelCategorias.php');

class CategoriasController
{
  private $vista;
  private $modelo;

  function __construct()
  {
    $this->modelo = new ModelCategorias();
    $this->vista = new ViewCategorias();
  }

  function mostrar(){
    $this->vista->mostrar($this->modelo->getCategorias());
  }

  function getImagenesVerificadas($imagenes){
    $imagenesVerificadas = [];
    for ($i=0; $i < count($imagenes['size']); $i++) {
      if($imagenes['size'][$i]>0 && $imagenes['type'][$i]=="image/jpeg"){
          $imagen_aux = [];
          $imagen_aux['tmp_name']=$imagenes['tmp_name'][$i];
          $imagen_aux['name']=$imagenes['name'][$i];
          $imagenesVerificadas[]=$imagen_aux;
      }
    }

    return $imagenesVerificadas;
  }

  function guardar(){
    $tarea = $_POST['tarea'];
    if(isset($_FILES['imagenes'])){
      $imagenesVerificadas = $this->getImagenesVerificadas($_FILES['imagenes']);
      if(count($imagenesVerificadas)>0){
        if(!$this->filtro($tarea)){
          $this->modelo->crearTarea($tarea,$imagenesVerificadas);
          $this->vista->mostrarMensaje("La tarea se creo con imagen y todo!", "success");
        }
      }
      else{
        $this->vista->mostrarMensaje("Error con las imagenes", "danger");
      }
    }
    else{
        $this->vista->mostrarMensaje("La imagen es requerida","danger");
    }

    $this->iniciar();
  }

  function eliminar(){
    echo "pase a eliminarrr";
    $key = $_GET['id'];
    $this->modelo->eliminarCategoria($key);
    $this->mostrar();
}

  function realizar(){
    $key = $_GET['id_tarea'];
    $this->modelo->toogleTarea($key);
    $this->iniciar();
  }

  function filtro($tarea){
    return preg_match('/podria/',$tarea);
  }


}

 ?>
