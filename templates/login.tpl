<!DOCTYPE html>
<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Todo PC - Inicio de sesión</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body class="blank  pace-done">

  <section class="content">
    <div class="back-link">
      <a href="index.php" class="btn btn-accent">Volver al inicio</a>
      <img src="images/logo.png" alt="Logo TODO-PC" class="pull-right"/>
    </div>

    <div class="container-center">

      <div class="view-header">
        <div class="header-icon">
          <i class="pe page-header-icon pe-7s-unlock"></i>
        </div>
        <div class="header-title">
          <h3>Ingreso</h3>
          <small>
            Por favor ingresa tus credenciales para poder ingresar.
          </small>
        </div>
      </div>

      <div class="panel panel-filled">
        <div class="panel-body">
          <form method="post" action="login">
            <div class="form-group">
              <label class="control-label" for="username">Usuario</label>
              <input type="text" placeholder="ejemplo@mail.com" name="username"  class="form-control" required autofocus>
            </div>
            <div class="form-group">
              <label class="control-label" for="password">Contraseña</label>
              <input type="password"  placeholder="******" name="password" class="form-control" required autofocus>
            </div>
            <div class="form-group">
              <div class="checkbox"><label> <input type="checkbox" name="notificaciones"> Mantener sesión iniciada</label></div>
            </div>
            <div>
              <button class="btn btn-accent" type="submit">Ingresar</button>
              <a class="btn btn-default" href="registrar">Registrar nuevo</a>
            </div>
            <br>
              {if isset($error)}
              <div class="panel panel-filled panel-c-danger">
                  <div class="panel-heading">{$error}</div>
              </div>
              {/if}
          </form>
      </div>
    </div>
  </section>

  {include file="footer.tpl"}
