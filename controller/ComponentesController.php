<?php
include_once("controller/Controller.php");
include_once("view/ViewComponentes.php");
include_once("models/ModelComponentes.php");
include_once("models/ModelCategorias.php");

class ComponentesController extends Controller{

  private $modelCategorias;


  function __construct(){
    parent::__construct();
    $this->view = new ViewComponentes();
    $this->model = new ModelComponentes();
    $this->modelCategorias = new ModelCategorias();
  }

  function home(){
    $this->updateData();
    $this->view->mostrarComponentes();
  }
  function mostrarInicio() {
    session_start();
    $this->asignarPermisos();
    $this->view->mostrarHome();
  }

  function mostrar_componentes(){
      $this->updateData();
      $this->view->actualizarPermisos($this->modelUsuario->getPermisosDenegados($_SESSION["user"]));
      $this->view->mostrarAdmin();
  }

  function mostrar_componente() {
    if(isset($_GET["id"])){
      $id_componente = $_GET["id"];
      $categoria = $this->model->getCategoriaComponente($id_componente);
      $componente = $this->model->getComponente($id_componente);
      $imagenes = $this->model->getImagenes($id_componente);
      $componente["imagenes"] = $imagenes;
      $this->view->mostrarComponente($categoria, $componente);
    }else $this->mostrarInicio();
  }
  function eliminar_componente(){
    if(isset($_GET["id"])){
      $key = $_GET['id'];
      $this->model->eliminarComponente($key);
    }
    $this->mostrar_componentes();

  }

  function agregar_componente(){
    $this->model->agregarComponente($this->crearComponente());
    $this->mostrar_componentes();
  }
  function crearComponente(){
    $newComponente = [];
    if( (isset($_POST['nombre'])) && (isset($_POST['categoria'])) ){
    $newComponente["nombre"] = $_POST['nombre'];
    $newComponente["destacado"] = isset($_POST['recomendado']);
    $newComponente["id_categoria"] = $_POST['categoria'];
    $newComponente["imagenes"] = $this->verificarImagenes($_FILES["imagenes"]);
  }
    return $newComponente;

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

  function editar_componente(){
    $newComponente = $this->crearComponente();
    if(isset($_GET['id'])){
      $newComponente["id"] = $_GET['id'];
      $this->eliminarImagenes($this->model->getImagenes($newComponente["id"]));
      $this->model->editarComponente($newComponente);
    }
    $this->mostrar_componentes();
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
    $this->view->asignarDatos($data);
  }

  function filtrar_categoria() {
    if (isset($_GET["id"])) {
      $categoria = $this->modelCategorias->getCategoria($_GET["id"]);
      $componentes = $this->model->getComponentesByCategoria($_GET["id"]);
      $data = ["componentes" => $componentes, "categorias" =>  $categoria];
      $this->view->asignarDatos($data);
      $this->view->filtrar();
    }
    else if(isset($_GET["categoria"])){
      $this->view->mostrarComponentesCategoria($this->model->getComponentesByCategoria($_GET["categoria"]));
    }
  }


}

?>
