<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target=".newUsuario">Crear nuevo</button>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">Administración de usuarios</h3>
            <small>Administra diferentes usuarios, cambiando sus permisos y creando nuevos.</small>
          </div>
        </div>
        <hr>
      </div>
    </div>

    <div class="modal fade newRol" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title">Agregar nuevo rol</h4>
          </div>
          <form  class="addRol" method="post">
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-12 col-xs-12">
                  <div class="form-group"><label for="componente">Nombre </label> <input type="name" class="form-control" name="nombre" required placeholder="ej. Moderador"></div>
                  <div class="col-xs-6">
                    <div class="form-group">
                      <div class="checkbox"><label><input type="checkbox" checked> Ver componentes </label></div>
                      <div class="checkbox"><label><input type="checkbox"> Agregar componentes </label></div>
                      <div class="checkbox"><label><input type="checkbox" checked> Ver administrador de componentes </label></div>
                      <div class="checkbox"><label><input type="checkbox" checked> Eliminar componentes </label></div>
                      <div class="checkbox"><label><input type="checkbox"> Editar componentes </label></div>
                      <div class="checkbox"><label><input type="checkbox"> Eliminar consultas </label></div>
                      <div class="checkbox"><label><input type="checkbox"> Enviar consultas </label></div>
                    </div>
                  </div>
                  <div class="col-xs-6">
                    <div class="form-group">
                      <div class="checkbox"><label><input type="checkbox"> Ver componente </label></div>
                      <div class="checkbox"><label><input type="checkbox" checked> Filtrar categorias </label></div>
                      <div class="checkbox"><label><input type="checkbox" checked> Crear categorias </label></div>
                      <div class="checkbox"><label><input type="checkbox"> Eliminar categorias </label></div>
                      <div class="checkbox"><label><input type="checkbox"> Editar categorias </label></div>
                      <div class="checkbox"><label><input type="checkbox" checked> Ver administrador de categorias </label></div>
                      <div class="checkbox"><label><input type="checkbox" checked> Ver administrador de consultas </label></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <button type="submit" class="btn btn-accent">Crear</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade newUsuario"  tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h4 class="modal-title">Nuevo usuario</h4>
        </div>
        <form class="addUsuario" action="index.php?action=x" method="post">
          <div class="modal-body">
            <div class="form-group"><label for="componente">Nombre </label> <input type="name" class="form-control" required name="nombre" placeholder="ej. Santii35"></div>
            <div class="form-group"><label for="componente">Email </label> <input type="email" class="form-control" required name="email" placeholder="santi_i35@gmail.com"></div>
            <div class="form-group"><label for="componente">Contraseña </label> <input type="password" class="form-control" required name="password" placeholder="**********"></div>
            <div class="form-group"><label for="componente">Rol</label>
              <select name="rol" class="form-control">
                <option value="1">Administrador</option>
                <option value="2" selected>Normal</option>
                <option value="3">Moderador</option>
                <option value="4">Visitante</option>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-accent">Crear</button>
          </div>
        </form>
      </div>
    </div>
  </div>


  <div class="row">
    <div class="col-xs-12">
      <div class="panel panel-filled">
        <div class="panel-heading">
          <div class="row">
            <div class="col-lg-12">
              <div class="view-header">
                <div class="pull-right text-right" style="line-height: 14px">
                  <form class="form-inline pull-right" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control" name="busqueda" placeholder="Buscar usuario..">
                    </div>
                    <button type="submit" class="btn btn-default">Buscar</button><br><br>
                    <span>Existen <strong>4</strong> usuarios registrados en el sistema</span>
                  </form>
                </div>
                <div class="header-title">
                  <h3 class="m-b-xs">Edicion de usuarios</h3>
                  <small>Cambia el rol, nombre o email de los usuarios.</small>
                </div>
              </div>
              <hr>
            </div>
          </div>
        </div>
        <div class="panel-body">
          <div class="panel">
            <div class="panel-body">

              <div class="table-responsive">
                <form class="" method="post">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Usuario</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Eliminar</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="usuarios">
                        <td><span>axelbau24</span><input type='text' name='username_id' value='axelbau24' class='input-e form-control ' readonly='readonly'/></td>
                        <td><span>axelbau24@gmail.com</span><input type='text' name='email_id' value='axelbau24@gmail.com' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>Administrador</span>
                          <select name='rol_id' class='editable form-control-n' readonly='readonly'>
                            <option value="Moderador">Moderador</option>
                            <option value="Administrador" selected>Administrador</option>
                            <option value="Normal">Normal</option>
                            <option value="Visitante">Visitante</option>
                          </select>
                        </td>
                        <td>x</td>
                      </tr>
                      <tr class="usuarios">
                        <td><span>juan53</span><input type='text' name='username_id' value='juan53' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>juanel53@email.com</span><input type='text' name='email_id' value='juanel53@email.com' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>Normal</span>
                          <select name='rol_id' class='editable form-control-n' readonly='readonly'>
                            <option value="Moderador">Moderador</option>
                            <option value="Administrador">Administrador</option>
                            <option value="Normal" selected>Normal</option>
                            <option value="Visitante">Visitante</option>
                          </select>
                        </td>
                        <td>x</td>
                      </tr>
                      <tr class="usuarios">
                        <td><span>lukitas312</span><input type='text' name='username_id' value='lukitas312' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>lukk_itas@ht.com</span><input type='text' name='email_id' value='lukk_itas@ht.com' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>Normal</span>
                          <select name='rol_id' class='editable form-control-n' readonly='readonly'>
                            <option value="Moderador">Moderador</option>
                            <option value="Administrador">Administrador</option>
                            <option value="Normal" selected>Normal</option>
                            <option value="Visitante">Visitante</option>
                          </select>
                        </td>
                        <td>x</td>
                      </tr>
                      <tr class="usuarios">
                        <td><span>marcoos04</span><input type='text' name='username_id' value='marcoos04' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>mark_04@gmail.com</span><input type='text' name='email_id' value='mark_04@gmail.com' class='input-e form-control' readonly='readonly'/></td>
                        <td><span>Moderador</span>
                          <select name='rol_id' class='editable form-control-n' readonly='readonly'>
                            <option value="Moderador" selected>Moderador</option>
                            <option value="Administrador">Administrador</option>
                            <option value="Normal">Normal</option>
                            <option value="Visitante">Visitante</option>
                          </select>
                        </td>
                        <td>x</td>
                      </tr>
                    </tbody>
                  </table>
                  <button type="submit" class="btn btn-default">Guardar</button>
                  <button type="button" class="btn btn-default btn-xs pull-right space-right" data-id="x">Mostrar mas</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-12">
      <div class="panel panel-filled">
        <div class="panel-heading">
          <div class="row">
            <div class="col-lg-12">
              <div class="view-header">
                <div class="pull-right text-right space-left" style="line-height: 14px">
                  <button type="button" class="btn btn-default" data-toggle="modal" data-target=".newRol">Nuevo rol</button>
                </div>
                <div class="pull-right text-right" style="line-height: 14px">
                  <select name="rol" class="categorias form-control">
                    <option value="0">Seleccionar rol..</option>
                    <option value="Administrador">Administrador</option>
                    <option value="Moderador">Moderador</option>
                  </select>
                </div>
                <div class="header-title">
                  <h3 class="m-b-xs">Edicion de roles</h3>
                  <small>Cambia los permisos de un rol, o simplemente crea uno nuevo.</small>
                </div>
              </div>
              <hr>
            </div>
          </div>
        </div>
        <div class="panel-body">
          <div class="panel panel-filled panel-c-info">
            <div class="panel-heading">
              <h3>Administrador</h3>
            </div>
            <div class="panel-body">

              <form class="" method="post">
                <div class="col-xs-4">
                  <div class="form-group">
                    <div class="checkbox"><label><input type="checkbox" checked> Ver componentes </label></div>
                    <div class="checkbox"><label><input type="checkbox"> Agregar componentes </label></div>
                    <div class="checkbox"><label><input type="checkbox" checked> Ver administrador de componentes </label></div>
                    <div class="checkbox"><label><input type="checkbox" checked> Eliminar componentes </label></div>
                    <div class="checkbox"><label><input type="checkbox"> Editar componentes </label></div>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group">
                    <div class="checkbox"><label><input type="checkbox"> Ver componente </label></div>
                    <div class="checkbox"><label><input type="checkbox" checked> Filtrar categorias </label></div>
                    <div class="checkbox"><label><input type="checkbox" checked> Crear categorias </label></div>
                    <div class="checkbox"><label><input type="checkbox"> Eliminar categorias </label></div>
                    <div class="checkbox"><label><input type="checkbox"> Editar categorias </label></div>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group">
                    <div class="checkbox"><label><input type="checkbox" checked> Ver administrador de categorias </label></div>
                    <div class="checkbox"><label><input type="checkbox" checked> Ver administrador de consultas </label></div>
                    <div class="checkbox"><label><input type="checkbox"> Eliminar consultas </label></div>
                    <div class="checkbox"><label><input type="checkbox"> Enviar consultas </label></div>
                  </div>
                </div>
                <div class="col-xs-12"><button type="submit" class="btn btn-default">Guardar</button></div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
