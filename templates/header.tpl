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

        {if !in_array("admin_roles", $permisos)}<li class="nav-roles"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-tasks"></span></div></div></a></li>{/if}
        {if !in_array("admin_usuarios", $permisos)}<li class="nav-usuarios"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-user"></span></div></div></a></li>{/if}
        {if !in_array("admin_componentes", $permisos)}<li class="nav-componentes"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-cog"></span></div></div></a></li>{/if}
        {if !in_array("admin_categorias", $permisos)}<li class="nav-categorias"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-tasks"></span></div></div></a></li>{/if}
        {if !in_array("mostrar_consultas", $permisos)}<li class="nav-consultas"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-book"></span></div></div></a></li>{/if}

        {if count($datosUsuario) > 0}<li class="pull-right"><a class="empty" href="logout"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-remove"></span></div></div></a></li>
        {else} <li class="pull-right"><a class="empty" href="login"><div class="panel panel-filled"><div class="panel-heading">Ingresar</div></div></a></li> {/if}
        <li class="nav-contacto"><a class="empty" href="#"><div class="panel panel-filled"><div class="panel-heading"><span class="glyphicon glyphicon-envelope"></span></div></div></a></li>
      </ul>
    </div>
    <br class="navbar-toggle">
    <aside class="navigation">
      <img src="images/logo.png" alt="Logo TODO-PC" class="img-thumbnail"/>

      <nav>
        <ul class="nav luna-nav">
          {if count($datosUsuario) > 0}<li class="nav-category"><strong>Bienvenido <i>{$datosUsuario["nombre"]}</i></strong></li>
          <button type="button" class="btn btn-xs btn-info space-left config">Configuración</button>
          <a href="logout"><button type="button" class="btn btn-xs btn-info">Salir</button></a>
          {else}<li class="nav-category"><strong>No ingresó al sistema</strong></li>
          <a href="login"><button type="button" class="btn btn-xs btn-info space-left">Iniciar Sesión</button></a>
          <a href="registrar"><button type="button" class="btn btn-xs btn-info">Registro</button></a>{/if}
          <li class="nav-category"><strong>Principal</strong></li>
          <li class="active nav-home"><a href="#">Listado de componentes</a></li>

          {assign var="titulo" value="<li class='nav-category'><strong>Administracion</strong></li>"}
          {assign var="showTitulo" value="1"}
          {function name="mostrarTitulo"}
             {if $showTitulo == 1} <div class="hidden">{$showTitulo++}</div> {$titulo}  {/if}
          {/function}
          {if !in_array("admin_roles", $permisos)}
          {mostrarTitulo} <li class="nav-roles"><a href="#">Roles <span class="fade">----</span></a></li> {/if}
          {if !in_array("admin_usuarios", $permisos)}
          {mostrarTitulo} <li class="nav-usuarios"><a href="#">Usuarios <span class="fade">-</span></a></li> {/if}
          {if !in_array("admin_componentes", $permisos)}
          {mostrarTitulo}<li class="nav-componentes"><a href="#">Componentes</a></li> {/if}
          {if !in_array("admin_categorias", $permisos)}
          {mostrarTitulo}<li class="nav-categorias"><a href="#">Categorías</a></li> {/if}
          {if !in_array("mostrar_consultas", $permisos)}
          {mostrarTitulo} <li class="nav-consultas"><a href="#">Ver consultas</a></li> {/if}

          {if !in_array("agregar_consulta", $permisos)}
          <li class="nav-category"><strong>Contacto</strong></li>
          <li class="nav-contacto"><a href="#">Contactanos</a></li> {/if}
          <li class="nav-info"><div class="hidden carga"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Cargando datos...</div><div class="m-t-xs">Web II - 2016 <br><strong>Diseñado por:</strong> Axel Bautista, Ezequiel Fazio</div></li>
        </ul>
      </nav>
    </aside>

    <div class="listado">

{include file="footer.tpl"}
