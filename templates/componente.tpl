<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <small>Diseñado por:<br><i>Axel Bautista</i><br><i>Ezequiel Fazio</i></small>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">{$componente["nombre"]}</h3>
            <small>Perteneciente a <span class="c-white">{$categoria}</span></small>
          </div>
        </div>
        <hr>
      </div>
    </div>
    <div class="row">

      <div class="col-md-12">
        {if $componente["destacado"]}
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-filled panel-c-warning">
              <div class="panel-heading">
                <h4><i>Este es un componente recomendado por la comunidad</i></h4>
              </div>
            </div>
          </div>
        </div>
        {/if}
        {if count($componente["imagenes"]) > 0}
        <h4>Imágenes de <strong>{$componente["nombre"]}</strong></h4>
      </div>

      <div class="row">
        {foreach from=$componente["imagenes"] item="imagen"}
        <div class="col-md-4">
          <div class="panel panel-filled panel-c-info">
            <div class="panel-body">
              <img class="img-thumbnail color-transparent" src="{$imagen["ruta"]}" alt="{$componente["nombre"]}-{$imagen["id_imagen"]}" />
            </div>
          </div>
        </div>
        {/foreach}
      </div>
      {else if}
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-filled panel-c-danger">
            <div class="panel-heading">
              <h4>Este componente no posee ninguna imagen</h4>
            </div>
          </div>
        </div>
      </div>
      {/if}
        <div class="comentarios-container panel panel-heading">

        <h3>Comentarios:</h3>
        <div class="comentarios">

        </div>
        {if isset($usuario)}
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-filled">
              <div class="panel-heading">
                <h4>Agregar comentario..</h4>
              </div>
              <div class="panel-body">
                <form class="agregarComentario" method="post">
                  <input type="hidden" name="id_componente" value="{$componente["id_componente"]}" class="id_componente">
                  <input type="hidden" name="id_usuario" value="{$usuario["id"]}">
                  <div class="form-group form-inline">
                    <label>Puntaje:</label>
                    <select class="form-control" name="puntaje">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option selected>5</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Comentario:</label>
                    <textarea class="form-control" rows="3" name="comentario" placeholder="Escriba un comentario..."></textarea>
                  </div>
                  <button type="submit" class="btn btn-default">Comentar</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        {/if}
      </div>

    </div>
  </section>
