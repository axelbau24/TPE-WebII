
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target=".newComp">Agregar nuevo</button>
          </div>


          <div class="modal fade newComp"  tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header text-center">
                  <h4 class="modal-title">Nuevo componente</h4>
                </div>
                <form class="addComponente" method="post" enctype="multipart/form-data">
                  <div class="modal-body">
                    <div class="form-group"><label for="componente">Nombre </label> <input type="name" required class="form-control" name="nombre" placeholder="ej. ASUS Q87M-E"></div>
                    <div class="form-group"><label for="componente">Categoría</label>
                      <select name="categoria" class="form-control">
                        {foreach from=$categorias key=index item=categoria}

                          <option value="{$categoria["id_categoria"]}">{$categoria["nombre"]}</option>

                        {/foreach}
                      </select>
                    </div>
                    <div class="form-group"><label> <input type="checkbox" name="recomendado"> Recomendado</label></div>
                    <div class="form-group"><label>Subir imagenes: </label><input type="file" name="imagenes[]"  value="" multiple=""></div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-accent">Guardar</button>
                  </div>
                </form>
              </div>
            </div>
          </div>

          {foreach from=$componentes item=componente}
          <div class="modal fade editComp-{$componente["id_componente"]}" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header text-center">
                  <h4 class="modal-title">Editar componente</h4>
                </div>
                <form data-id="{$componente['id_componente']}" class="editarComponente" action="index.php?action=editar_componente&id={$componente['id_componente']}" method="post" enctype="multipart/form-data">
                  <div class="modal-body">
                    <div class="row">
                      {if count($componente["imagenes"]) > 0}<div class="col-lg-6 col-xs-6"> {else} <div class="col-lg-12 col-xs-12"> {/if}
                        <div class="form-group"><label for="componente">Nombre </label> <input type="name" class="form-control" name="nombre" required value="{$componente["nombre"]}"></div>
                        <div class="form-group"><label for="componente">Categoría</label>
                          <select name="categoria" class="form-control">
                            {foreach from=$categorias key=index item=categoria}
                            <div class="col-lg-6 col-xs-6">
                              <option value="{$categoria["id_categoria"]}" {if $categoria["id_categoria"] == $componente["fk_id_categoria"]} selected {/if}>{$categoria["nombre"]}</option>
                              </div>
                            {/foreach}
                          </select>
                        </div>
                        <div class="form-group"><label>Subir imagenes: </label><input type="file" name="imagenes[]" value="" multiple=""></div>
                        <div class="form-group"><label> <input type="checkbox" name="recomendado" {if $componente["destacado"]} checked {/if}> Recomendado</label></div>
                      </div>
                      {if count($componente["imagenes"]) > 0}
                      <div class="col-lg-6 col-xs-6">
                        <div class="form-group"><label for="componente">Eliminar imágenes <small>(Seleccionar)</small></label></div>
                        <div class="row">
                          {foreach from=$componente["imagenes"] item=imagen}
                          <div class="col-lg-6 col-xs-6">
                            <label><img src="{$imagen["ruta"]}" alt="{$componente["nombre"]}_{$imagen["id_imagen"]}" class="img-thumbnail"><input type="checkbox" name="img_{$imagen["id_imagen"]}" class="hidden"></label>
                          </div>
                          {/foreach}
                        </div>
                      </div>
                      {/if}

                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-accent">Guardar</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
          {/foreach}

          <div class="header-title">
            <h3 class="m-b-xs">Administración de componentes de PC</h3>
            <small>Administra diferentes componentes editandolos, eliminando y agregando nuevos.</small>
          </div>
        </div>
        <hr>
      </div>
    </div>
      <div class="row">
        {foreach from=$categorias item=categoria key=index}
        {if $index % 2 == 0}<div class="row">{/if}
        <div class="col-lg-6 col-xs-12">
            <ul class="list-group">
              <li class="list-group-item active-custom"><strong class="color-white">{$categoria["nombre"]}</strong></a>
              {foreach from=$componentes item=componente}
              {if $componente["fk_id_categoria"] == $categoria["id_categoria"]}
              <li class="list-group-item">{if $componente["destacado"]}<div class="glyphicon glyphicon-ok-sign destacado"></div> {/if}{$componente["nombre"]}
                <a class="eliminarComponente glyphicon glyphicon-trash pull-right color-white" data-id={$componente["id_componente"]}></a> <!--Boton eliminar -->
                <a class="glyphicon glyphicon-duplicate pull-right color-white space-right" data-toggle="modal" data-target=".editComp-{$componente["id_componente"]}"></a> <!--Boton editar -->
                <button type="button" class="mostrarComponente btn btn-default btn-xs pull-right space-right" data-id={$componente["id_componente"]}>Ver mas</button>
              </li>
              {/if}
              {/foreach}
            </ul>
        </div>
        {if $index % 2 != 0}</div>{/if}
        {/foreach}
      </div>
      </section>
