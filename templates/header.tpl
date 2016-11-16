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

          <div class="modal fade iniciar iniciar_sesion"  tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header text-center">
                  <h4 class="modal-title">Inicio de sesión</h4>
                </div>

              </div>
            </div>
          </div>

      <nav>
        <ul class="nav luna-nav">
          {if isset($usuario)}<li class="nav-category"><strong>Bienvenido <i>{$usuario}</i></strong></li>
          <button type="button" class="btn btn-xs btn-info space-left">Configuración</button>
          <a href="logout"><button type="button" class="btn btn-xs btn-info">Salir</button></a>
          {else}<li class="nav-category"><strong>No ingresó al sistema</strong></li>
          <a href="login"><button type="button" class="btn btn-xs btn-info space-left">Iniciar Sesión</button></a>
          <a href="registrar"><button type="button" class="btn btn-xs btn-info">Registro</button></a>{/if}
          <li class="nav-category"><strong>Principal</strong></li>
          <li class="active nav-home"><a href="#">Listado de componentes</a></li>

          {if isset($usuario)}
          {assign var="titulo" value="<li class='nav-category'><strong>Administracion</strong></li>"}
          {assign var="showTitulo" value="1"}
          {function name="mostrarTitulo"}
             {if $showTitulo == 1} <div class="hidden">{$showTitulo++}</div> {$titulo}  {/if}
          {/function}

          {if !in_array("admin_usuarios", $permisos)}
          {mostrarTitulo} <li class="nav-usuarios"><a href="#">Usuarios</a></li> {/if}
          {if !in_array("mostrar_componentes", $permisos)}
          {mostrarTitulo}<li class="nav-componentes"><a href="#">Componentes</a></li> {/if}
          {if !in_array("mostrar_categorias", $permisos)}
          {mostrarTitulo}<li class="nav-categorias"><a href="#">Categorías</a></li> {/if}
          {if !in_array("mostrar_consultas", $permisos)}
          {mostrarTitulo} <li class="nav-consultas"><a href="#">Ver consultas</a></li> {/if}

          {/if}

          <li class="nav-category"><strong>Contacto</strong></li>
          <li class="nav-contacto"><a href="#">Contactanos</a></li>
          <li class="nav-info"><div class="hidden carga"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Cargando datos...</div><div class="m-t-xs">Web II - 2016 <br><strong>Diseñado por:</strong> Axel Bautista, Ezequiel Fazio</div></li>
        </ul>
      </nav>
    </aside>

    <div class="listado">

{include file="footer.tpl"}
