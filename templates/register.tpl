<!DOCTYPE html>
<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Todo PC - Inicio de sesión</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/panels.css">
</head>
<body class="blank  pace-done">

  <section class="content">
    <div class="back-link">
      <a href="index.php" class="btn btn-accent">Volver al inicio</a>
      <img src="images/logo.png" alt="Logo TODO-PC" class="pull-right"/>
    </div>

    <div class="container-center lg">

      <div class="view-header">
        <div class="header-icon">
          <i class="pe page-header-icon pe-7s-unlock"></i>
        </div>
        <div class="header-title">
          <h3>Creación de nuevo usuario</h3>
          <small>
            Ingresa los siguientes datos para crear su usuario.
          </small>
        </div>
      </div>

      <div class="panel panel-filled">
          <div class="panel-body">
              <form method="post">
                  <div class="row">
                      <div class="form-group col-lg-6">
                          <label>Nombre de usuario</label>
                          <input type="name" value="" class="form-control" name="username" placeholder="ej. Pablo24" required>
                      </div>
                      <div class="form-group col-lg-6">
                          <label>Email</label>
                          <input type="email" placeholder="ejemplo@email.com" class="form-control" name="email" required>
                      </div>
                      <div class="form-group col-lg-6 has-feedback">
                          <label>Contraseña</label>
                          <input type="password" value="" id="passwordCheck" class="form-control" name="password" placeholder="*******">
                          <span class="hidden glyphicon glyphicon-ok form-control-feedback success-icon" aria-hidden="true"></span>
                          <span class="help-block small">Seguridad de contraseña: <span id="pwseguridad"></span></span>
                      </div>
                      <div class="form-group col-lg-6 has-feedback">
                          <label>Repetir contraseña</label>
                          <input type="password" id="newPasswordCheck" class="form-control" placeholder="*******" name="r_password" required>
                          <span class="hidden glyphicon glyphicon-remove form-control-feedback error-icon" aria-hidden="true"></span>
                          <span class="hidden help-block small pull-right msg-match">Las contraseñas no coinciden</span>
                      </div>
                      <div class="form-group col-lg-12">
                        <div class="checkbox"><label> <input type="checkbox" name="notificaciones" value=""> Recibir notificaciones</label></div>
                      </div>
                  </div>
                  <div>
                      <button type="submit" disabled class="btn btn-default">Crear</button>
                  </div>
              </form>
          </div>
      </div>
    </div>
  </section>

  {include file="footer.tpl"}
