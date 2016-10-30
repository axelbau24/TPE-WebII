<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Todo PC - Estamos cerca tuyo</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/panels.css">
  <link rel="stylesheet" href="css/toastr.min.css">
  <body class="pace-done">

    <div class="navbar navbar-inverse navbar-toggle navbar-fixed-top">
      <ul class="nav navbar-nav">
        <li class="nav-home"><a class="empty" href="#"><div class="panel panel-filled panel-c-warning"><div class="panel-heading"><span class="glyphicon glyphicon-home"></span></div></div></a></li>
        <li><a class="empty" href="#"><div class="panel panel-filled separator-pad">|</div></a></li>
        <li class="nav-componentes"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-cog"></span></div></div></a></li>
        <li class="nav-categorias"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-tasks"></span></div></div></a></li>
        <li class="nav-consultas"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-book"></span></div></div></a></li>
        <li><a class="empty" href="#"><div class="panel panel-filled separator-pad">|</div></a></li>
        <li class="nav-contacto"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-envelope"></span></div></div></a></li>
      </ul>
    </div>
    <br class="navbar-toggle">
    <aside class="navigation">
      <img src="images/logo.png" alt="Logo TODO-PC" class="img-thumbnail"/>

      <nav>
        <ul class="nav luna-nav">
          <li class="nav-category"><strong>Principal</strong></li>
          <li class="active nav-home"><a href="#">Listado de componentes</a></li>
          <li class="nav-category"><strong>Administracion</strong></li>
          <li class="nav-componentes"><a href="#">Componentes</a></li>
          <li class="nav-categorias"><a href="#">Categorías</a></li>
          <li class="nav-consultas"><a href="#">Ver consultas</a></li>
          <li class="nav-category"><strong>Contacto</strong></li>
          <li class="nav-contacto"><a href="#">Contactanos</a></li>
          <li class="nav-info"><div class="hidden carga"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Cargando datos...</div><div class="m-t-xs">Web II - 2016 <br><strong>Diseñado por:</strong> Axel Bautista, Ezequiel Fazio</div></li>
        </ul>
      </nav>
    </aside>

    <div class="listado">

{include file="footer.tpl"}
