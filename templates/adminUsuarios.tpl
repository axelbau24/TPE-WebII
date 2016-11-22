<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          {if !in_array("agregar_usuario", $permisos)}
          <div class="pull-right text-right" style="line-height: 14px">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target=".newUsuario">Crear nuevo</button>
          </div>
          {/if}
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
                  {foreach from=$actions item=action}
                  <div class="col-lg-6 col-xs-4">
                    <div class="form-group">
                      <div class="checkbox"><label><input type="checkbox" name="id_{$action['id_accion']}"> {$action['nombre']} </label></div>
                    </div>
                  </div>
                  {/foreach}
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
                      <input type="text" class="form-control" name="busqueda" placeholder="Buscar usuario.." required>
                    </div>
                    <button type="submit" class="btn btn-default">Buscar</button><br><br>
                    <span>Existen <strong>{$cantUsuarios}</strong> usuarios registrados en el sistema</span>
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
                        {if !in_array("eliminar_usuario", $permisos)}<th>Eliminar</th>{/if}
                      </tr>
                    </thead>
                    <tbody>
                        {foreach from=$usuarios item=usuario}
                      <tr class="usuario">
                        <td>
                          <span>{$usuario["nombre"]}</span>
                            {if !in_array("editar_usuario", $permisos)}<input type='text' name='username' value='{$usuario["nombre"]}' class='input-e form-control ' readonly='readonly'/>{/if}
                        </td>
                        <td>
                          <span>{$usuario["email"]}</span>
                          {if !in_array("editar_usuario", $permisos)}<input type='text' name='email' value='{$usuario["email"]}' class='input-e form-control' readonly='readonly'/>{/if}
                        </td>
                        <td>
                          <span>{$usuario["rol"]}</span>
                            {if !in_array("editar_usuario", $permisos)}
                            <select name="rol" class='editable form-control-n input-e' readonly='readonly'>
                                {foreach from=$roles item=rol}
                              <option value="{$rol["nombre"]}" data-id="{$rol["id_rol"]}" {if $rol["id_rol"] == $usuario["fk_id_rol"]} selected {/if}>{$rol["nombre"]}</option>
                                {/foreach}
                            </select>
                            {/if}
                        </td>

                        {if !in_array("eliminar_usuario", $permisos)}<td><div data-id="{$usuario["id_usuario"]}" class="glyphicon glyphicon-remove eliminarUsuario error-icon"></div></td>{/if}
                        {if !in_array("editar_usuario", $permisos)}<td><button type="button" data-id="{$usuario["id_usuario"]}" class="guardarUsuario btn btn-default">Guardar</button></td>{/if}

                      </tr>
                      {/foreach}


                    </tbody>
                  </table>

                  <button type="button" class="mostrarMas btn btn-default btn-xs pull-right space-right">Mostrar mas</button>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    {if !in_array("update_permisos", $permisos) && !in_array("agregar_rol", $permisos)}
  <div class="row">
    <div class="col-xs-12">
      <div class="panel panel-filled">
        <div class="panel-heading">
          <div class="row">
            <div class="col-lg-12">
              <div class="view-header">
                <div class="pull-right text-right space-left" style="line-height: 14px">
                  {if !in_array("agregar_rol", $permisos)}<button type="button" class="btn btn-default" data-toggle="modal" data-target=".newRol">Nuevo rol</button>{/if}
                </div>
                <div class="pull-right text-right" style="line-height: 14px">
                  <select name="rol" class="roles form-control">
                    {foreach from=$roles item=rol}
                      <option {if $permiso["rol"]["id_rol"] == $rol["id_rol"]} selected {/if} value="{$rol["id_rol"]}">{$rol["nombre"]}</option>
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
              <h3>{$permiso["rol"]["nombre"]}
              {foreach from=$roles item=rol}
                {if $permiso["rol"]["nombre"] == $rol["nombre"] && $rol["cantUsuarios"] == 0} {if !in_array("eliminar_rol", $permisos)}<div data-id="{$permiso["rol"]["id_rol"]}" class="pull-right glyphicon glyphicon-remove error-icon eliminarRol"></div> {/if}{/if}
              {/foreach}
              </h3>
            </div>
            <div class="panel-body">
              <form class="cambiarPermisos" method="post" data-id={$permiso["rol"]["id_rol"]}>
                {foreach from=$actions item=action}
                <div class="col-lg-6 col-xs-4">
                  <div class="form-group">
                    <div class="checkbox"><label><input {if !in_array($action['id_accion'], $permiso)} checked {/if} type="checkbox" name="id_{$action['id_accion']}"> {$action['nombre']} </label></div>
                  </div>
                </div>
                {/foreach}
                {if !in_array("update_permisos", $permisos)}<div class="col-xs-12"><button type="submit" class="btn btn-default">Guardar</button></div>{/if}
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  {/if}
</section>
