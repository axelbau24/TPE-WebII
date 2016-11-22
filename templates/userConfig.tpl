<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <small>Diseñado por:<br><i>Axel Bautista</i><br><i>Ezequiel Fazio</i></small>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">Configuración del usuario</h3>
            <small>Hace cambios a tu cuenta, cambia tu contraseña o email.</small>
          </div>
        </div>
        <hr>
      </div>
    </div>
    <div class="row">
      <div class="panel panel-filled">

          <div class="panel-body">
            <div class="col-lg-6 col-xs-12">
              <div class="panel panel-filled text-center">
                        <div class="panel-heading"><h3>Usuario <i>axelbau24</i></h3></div>
                        <div class="panel-body">
                            <img class="img-thumbnail img-responsive color-transparent" src="images/avatar/default.png" alt="" />
                        </div>
                        <div class="panel-footer"><label>Email: <i>axelbau24@gmail.com</i></label></div>
                    </div>

            </div>
            <div class="col-lg-6 col-xs-12">
              <form class="addComponente" method="post" enctype="multipart/form-data">
                  <div class="modal-body">
                    <div class="form-group"><label for="componente">Email: </label> <input type="email" required="" class="form-control" name="email" value="axelbau24@gmail.com"></div>
                    <div class="form-group"><label for="componente">Cambiar contraseña: </label>
                    <input type="password" required="" class="form-control" name="password" placeholder="Contraseña actual" ><br>
                    <input type="password" required="" class="form-control" name="new_password" placeholder="Nueva contraseña" ><br>
                    <input type="password" required="" class="form-control" name="c_new_password" placeholder="Confirmar nueva contraseña" >
                    </div>

                    <div class="form-group"><label>Cambiar avatar: </label><input type="file" name="avatar" value=""></div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Guardar datos</button>
                  </div>
                </form>
            </div>

          </div>
      </div>
      </div>
    </div>
  </div>
</section>
