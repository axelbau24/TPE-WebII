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


          <div class="modal fade iniciar"  tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header text-center">
                  <h4 class="modal-title">Inicio de sesión</h4>
                </div>
                <form class="iniciar_sesion" method="post" action="index.php?action=login">
                  <div class="modal-body">
                    <div class="form-group"><label for="usuario">Usuario </label> <input type="username" required class="form-control" name="username" placeholder="ej. Marcos19"></div>
                    <div class="form-group"><label for="password">Contraseña </label> <input type="password" required class="form-control" name="password" placeholder="•••••••"></div>

                    <div class="form-group"><label> <input type="checkbox" name="mantener_sesion"> Mantener sesión iniciada</label></div>
                   </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-accent">Ingresar</button>
                  </div>
                </form>
              </div>
            </div>
          </div>

          <div class="modal fade registro"  tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header text-center">
                  <h4 class="modal-title">Nuevo usuario</h4>
                </div>
                <form class="iniciar_sesion" method="post">
                  <div class="modal-body">
                    <div class="form-group"><label for="user">Usuario </label> <input type="username" required class="form-control" name="username" placeholder="ej. Lucas31"></div>
                    <div class="form-group"><label for="email">Email </label> <input type="email" required class="form-control" name="email" placeholder="ej. lucas31@gmail.com"></div>
                    <div class="form-group"><label for="password">Contraseña </label> <input type="password" required class="form-control" name="password" placeholder="•••••••"></div>

                    <div class="form-group"><label> <input type="checkbox" name="notificaciones"> Recibir notificaciones</label></div>
                   </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-accent">Crear</button>
                  </div>
                </form>
              </div>
            </div>
          </div>

      <nav>
        <ul class="nav luna-nav">
          {if isset($sesion)}<li class="nav-category"><strong>Bienvenido <i>{$sesion["user"]}</i></strong></li>
          <button type="button" class="btn btn-xs btn-info space-left">Configuración</button>
          <a href="index.php?action=logout"><button type="button" class="btn btn-xs btn-info">Salir</button></a>
          {else}<li class="nav-category"><strong>No ingreso al sistema</strong></li>
          <button type="button" class="btn btn-xs btn-info space-left" data-toggle="modal" data-target=".iniciar">Iniciar Sesión</button>
          <button type="button" class="btn btn-xs btn-info" data-toggle="modal" data-target=".registro">Registro</button>{/if}
          <li class="nav-category"><strong>Principal</strong></li>
          <li class="active nav-home"><a href="#">Listado de componentes</a></li>

          {if isset($sesion)}
          {assign var="return" value="0"}
          {function name=verificar action=nombre}
            {assign var="i" value="0"}
            {while $i < count($permisos) && $permisos[$i]["accion_denegada"] != $action}
              <div class="hidden">{$i++}</div>
            {/while}
            {if $i == count($permisos)}<div class="hidden"> {$return++} </div>{/if}
            {assign var="return" value="0"}
          {/function}

          {assign var="titulo" value="<li class='nav-category'><strong>Administracion</strong></li>"}
          {assign var="showTitulo" value="1"}
          {function name="mostrarTitulo"}
             {if $showTitulo == 1} <div class="hidden">{$showTitulo++}</div> {$titulo}  {/if}
          {/function}

          {assign var="return" value="0"}
          {verificar action="mostrar_componentes"}
          {if $return} {mostrarTitulo}<li class="nav-componentes"><a href="#">Componentes</a></li> {/if}
          {assign var="return" value="0"}
          {verificar action="mostrar_categorias"}
          {if $return} {mostrarTitulo}<li class="nav-categorias"><a href="#">Categorías</a></li> {/if}
          {assign var="return" value="0"}
          {verificar action="mostrar_consultas"}
          {if $return} {mostrarTitulo} <li class="nav-consultas"><a href="#">Ver consultas</a></li> {/if}
          {/if}

          <li class="nav-category"><strong>Contacto</strong></li>
          <li class="nav-contacto"><a href="#">Contactanos</a></li>
          <li class="nav-info"><div class="hidden carga"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Cargando datos...</div><div class="m-t-xs">Web II - 2016 <br><strong>Diseñado por:</strong> Axel Bautista, Ezequiel Fazio</div></li>
        </ul>
      </nav>
    </aside>

    <div class="listado">

{include file="footer.tpl"}
