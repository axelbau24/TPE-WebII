<?php
include_once("view/ViewComponentes.php");
include_once("models/ModelComponentes.php");
include_once("models/ModelCategorias.php");

class ComponentesController
{
  private $vista;
  private $model;
  private $modelCategorias;
  function __construct()
  {
    $this->vista = new ViewComponentes();
    $this->model = new ModelComponentes();
    $this->modelCategorias = new ModelCategorias();
  }

  function iniciar()//esto se debe llamar mostrar
  {
    $this->updateData();
    $this->vista->mostrarComponentes();
  }

  function administracion(){
    if(isset($_GET["categoria"])) // Usado para el filtro de categorias
      $this->vista->mostrarComponentesCategoria($this->model->getComponentesByCategoria($_GET["categoria"]));
    else {
      $this->updateData();
      $this->vista->mostrarAdmin();
    }
  }

  function mostrarComponente($id_componente){
    $categoria = $this->model->getCategoriaComponente($id_componente);
    $componente = $this->model->getComponente($id_componente);
    $imagenes = $this->model->getImagenes($id_componente);
    $componente["imagenes"] = $imagenes;
    $this->vista->mostrarComponente($categoria, $componente);
  }
  function eliminar(){
    $key = $_GET['id'];
    $this->modelo->eliminarComponente($key);
    $this->iniciar();
  }

  function agregar(){
    $name = $_POST['nombre'];
    $destacado = $_POST['destacado'];
    $categoria = $_POST['categoria'];
    $this->modelo->agregarComponente($name,$destacado,$categoria);
    $this->iniciar();
  }

  function verificarImagenes($imagenes){
    $nuevasImagenes = [];
    for ($i=0; $i < count($imagenes["size"]) ; $i++) {
      $extension = $imagenes["type"][$i];
      if($extension == "image/jpeg" || $extension == "image/png"){
          $nuevaImagen["ext"] = "." . explode("/", $extension)[1];
          $nuevaImagen["tmp_name"] = $imagenes["tmp_name"][$i];
          $nuevasImagenes[] = $nuevaImagen;
      }
    }
    return $nuevasImagenes;
  }

  function editar(){
    $newComponente["id"] = $_GET['id'];
    $newComponente["nombre"] = $_POST['nuevo-nombre'];
    $newComponente["destacado"] = isset($_POST['nuevo-recomendado']);
    $newComponente["id_categoria"] = $_POST['nueva-categoria'];

    $imagenes = $this->verificarImagenes($_FILES["imagenes"]);
    $this->model->addImages($imagenes, $newComponente["id"]);

    $this->eliminarImagenes($this->model->getImagenes($newComponente["id"]));
    $this->model->editarComponente($newComponente);

    $this->updateData();
    $this->vista->listaAdmin();
  }


  function eliminarImagenes($imagenes){
    foreach ($imagenes as $imagen) {
      if(isset($_POST["img_".$imagen["id_imagen"]]))
        $this->model->eliminarImagen($imagen);
    }
  }

  function updateData(){
    $categorias = $this->modelCategorias->getCategorias();
    $componentes = $this->model->getComponentes();
    foreach ($componentes as $key => $componente) {
      $componentes[$key]["imagenes"] = $this->model->getImagenes($componente["id_componente"]);
    }
    $data = ["componentes" => $componentes, "categorias" =>  $categorias];
    $this->vista->asignarDatos($data);
  }

  function filtrar() {
    if (isset($_GET["id"])) {
      $categoria = $this->modelCategorias->getCategoria($_GET["id"]);
      $componentes = $this->model->getComponentesByCategoria($_GET["id"]);
      $this->vista->filtrar($componentes, $categoria);
    }
  }
}

 ?>
