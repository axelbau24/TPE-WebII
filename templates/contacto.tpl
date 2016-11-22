
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <small>Diseñado por:<br><i>Axel Bautista</i><br><i>Ezequiel Fazio</i></small>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">Contactanos</h3>
            <small>No te quedes con dudas..</small>
          </div>
        </div>
        <hr>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="panel panel-filled">
          <div class="panel-heading">
            Formulario de contacto
          </div>
          <div class="panel-body">
              <form class="contacto" method="post">

                <div class="form-group"><label for="name">Nombre:</label>
                  {if count($datosUsuario) > 0} {$datosUsuario["nombre"]}
                  <input type="hidden" required class="form-control" name="name" value="{$datosUsuario["nombre"]}">
                  {else}
                  <input type="name" required class="form-control" name="name" placeholder="Nombre"> {/if}
                </div>
                  <div class="form-group"><label for="email">Email:</label>
                    {if count($datosUsuario) > 0}  {$datosUsuario["email"]}
                    <input type="hidden" class="form-control" name="mail" value="{$datosUsuario["email"]}" required>
                    {else}
                    <input type="email" class="form-control" name="mail" placeholder="mail@ejemplo.com" required> {/if}
                  </div>
                <div class="form-group"><label for="consulta">Su consulta</label> <textarea name="consulta" class="form-control" rows="3" placeholder="Escriba su consulta aqui..." required></textarea></div>
                  <div class="checkbox"><label> <input type="checkbox" name="notificacion"> Recibir notificaciones </label></div>
                  <button type="submit" class="btn btn-default">Enviar</button>
                </form>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
