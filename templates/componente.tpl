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
          <div class="row">
            <div class="col-md-12">
              <div class="panel panel-filled">
                <div class="panel-heading">
                  <div class="panel-tools">
                    <a class="panel-fecha">13 de noviembre, 2016</a>
                    <a class="panel-puntaje"><i class="glyphicon glyphicon-thumbs-up success-icon"></i> <strong>5</strong></a>
                    <a class="panel-eliminar"><i class="glyphicon glyphicon-remove error-icon"></i></a>
                  </div>

                  <img alt="usuario_axelbau24" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/21210049?v=3&amp;s=40" width="20">
                  <span><i>axelbau24</i> comentó:</span>
                </div>
                <div class="panel-body">
                  <div class="comentario-text space-left">
                      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-12">
              <div class="panel panel-filled">
                <div class="panel-heading">
                  <div class="panel-tools">
                    <a class="panel-fecha">15 de noviembre, 2016</a>
                    <a class="panel-puntaje"><i class="glyphicon glyphicon-thumbs-up success-icon"></i> <strong>2</strong></a>
                    <a class="panel-close"><i class="glyphicon glyphicon-remove error-icon"></i></a>
                  </div>

                  <img alt="usuario_markos35" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/6765956?v=3&s=460" width="20">
                  <span><i>markos35</i> comentó:</span>
                </div>
                <div class="panel-body">
                  <div class="comentario-text space-left">
                      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-filled">
              <div class="panel-heading">
                <!-- <div class="panel-tools">
                  <a class="panel-puntaje"><i class="glyphicon glyphicon-thumbs-up success-icon"></i> <strong>2</strong></a>
                  <a class="panel-close"><i class="glyphicon glyphicon-remove error-icon"></i></a>
                </div> -->
                <h4>Agregar comentario..</h4>
              </div>
              <div class="panel-body">
                <form class="">
                  <div class="form-group form-inline">
                    <label>Puntaje:</label>
                    <select class="form-control">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option selected>5</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Comentario:</label>
                    <textarea class="form-control" rows="3" placeholder="Escriba un comentario..."></textarea>
                  </div>
                  <button type="submit" class="btn btn-default">Comentar</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>
