<section class="content">
  <div class="container-fluid">

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

    {if !in_array("admin_roles", $permisos)}
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
                {if $permiso["rol"]["nombre"] == $rol["nombre"] && $rol["cantUsuarios"] == 0 && $rol["id_rol"] != 4} {if !in_array("eliminar_rol", $permisos)}<div data-id="{$permiso["rol"]["id_rol"]}" class="pull-right glyphicon glyphicon-remove error-icon eliminarRol"></div> {/if}{/if}
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
