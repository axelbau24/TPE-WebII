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
            <div class="form-group"><label for="componente">Nombre </label> <input type="name" class="form-control" required name="usuario" placeholder="ej. Santii35"></div>
            <div class="form-group"><label for="componente">Email </label> <input type="email" class="form-control" required name="email" placeholder="santi_i35@gmail.com"></div>
            <div class="form-group"><label for="componente">Contraseña </label> <input type="password" class="form-control" required name="password" placeholder="**********"></div>
            <div class="form-group"><label for="componente">Rol</label>
              <select name="rol" class="form-control">
                {foreach from=$roles item=rol}
              <option value="{$rol["id_rol"]}">{$rol["nombre"]}</option>
                {/foreach}

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
                  <form class="form-inline pull-right buscarUsuario" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control" name="busqueda" placeholder="Buscar usuario..">
                    </div>
                    <button type="submit" class="btn btn-default">Buscar</button><br><br>
                    {if count($usuarios) > 1}   <span>Existen <strong>{count($usuarios)}</strong> usuarios registrados en el sistema</span> {/if}
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
                        {foreach from=$usuarios item=usuario}
                      <tr class="usuarios">

                        <td><span class="usuarioEditado">{$usuario["nombre"]}</span><input type='text' name='username' value='{$usuario["nombre"]}' class='input-e form-control ' readonly='readonly'/></td>
                        <td><span class="usuarioEditado">{$usuario["email"]}</span><input type='text' name='email' value='{$usuario["email"]}' class='input-e form-control' readonly='readonly'/></td>
                        <td><span class="usuarioEditado">{$usuario["rol"]}</span>
                          <select name='rol' class='editable form-control-n' readonly='readonly'>
                              {foreach from=$roles item=rol}
                            <option value="{$rol["nombre"]}" {if $rol["id_rol"] == $usuario["fk_id_rol"]} selected {/if}>{$rol["nombre"]}</option>
                              {/foreach}
                          </select>
                        </td>
                        <td data-id="{$usuario["id_usuario"]}" class="eliminarUsuario">X</td>
                        <td>
                          <button type="submit" class="btn btn-default">Guardar</button>
                        </td>

                      </tr>
                      {/foreach}


                    </tbody>
                  </table>

                  <button type="button" class="btn btn-default btn-xs pull-right space-right" data-id="x">Mostrar mas</button>

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
                    {foreach from=$roles item=rol}
                      <option value="{$rol["id_rol"]}">{$rol["nombre"]}</option>
                    {/foreach}


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
                    {foreach from=$permisos item=permiso}
                    <div class="checkbox"><label><input type="checkbox" id-accion="{$permiso['id_accion']}"> {$permiso['nombre']} </label></div>
                    {/foreach}
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
