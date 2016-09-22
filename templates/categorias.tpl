{include file="header.tpl"}

    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <div class="view-header">
              <div class="pull-right text-right" style="line-height: 14px">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target=".newCat">Agregar nuevo</button>
              </div>


              <div class="modal fade newCat"  tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-sm">
                  <div class="modal-content">
                    <div class="modal-header text-center">
                      <h4 class="modal-title">Nueva categoría</h4>
                    </div>
                    <form>
                      <div class="modal-body">
                        <div class="form-group"><label for="componente">Nombre </label> <input type="name" class="form-control" name="componente" placeholder="ej. Motherboards"></div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-accent">Guardar</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>


              <div class="modal fade editCat" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-sm">
                  <div class="modal-content">
                    <div class="modal-header text-center">
                      <h4 class="modal-title">Editar categoria</h4>
                    </div>
                    <form>
                      <div class="modal-body">
                        <div class="form-group"><label for="componente">Nombre </label> <input type="name" class="form-control" name="componente" value="Motherboards"></div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-accent">Guardar</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

              {foreach from=$categorias key=index item=categoria}
              <div class="modal fade eliminarCat-{$categoria['id_categoria']}" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header text-center">
                      <h4 class="modal-title">Eliminar categoria</h4>
                    </div>
                    <form>
                      <div class="modal-body">


                    <div class="panel panel-filled panel-c-danger">
                        <div class="panel-heading">
                            Al eliminar esta categoría, se eliminaran los 5 componentes que contiene. <br><i>¿Seguro que quiere eliminarla?</i>
                        </div>
                    </div>
                </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-accent">Confirmar</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              {/foreach}
              <div class="header-title">
                <h3 class="m-b-xs">Listado de categorías</h3>
                <small>Listado de categorías de componentes.</small>
              </div>
            </div>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 col-xs-12">
              <ul class="list-group">
                <li class="list-group-item active-custom"><strong class="color-white">Categorías</strong></a>
                   {foreach from=$categorias key=index item=categoria}


            <li class="list-group-item">{$categoria['nombre']}<a class="glyphicon glyphicon-trash pull-right color-white" data-toggle="modal" data-target=".eliminarCat-{$categoria['id_categoria']}"></a><a class="glyphicon glyphicon-duplicate pull-right color-white space-right" data-toggle="modal" data-target=".editCat"></a><span class="badge pull-right space-right"><strong>Cantidad: </strong>{$categoria['cantidad']}</span></li>
              {/foreach}
              </ul>
          </div>
        </div>
      </div>
    </section>
{include file="footer.tpl"}
