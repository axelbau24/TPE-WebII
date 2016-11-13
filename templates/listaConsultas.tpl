<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <small>Diseñado por:<br><i>Axel Bautista</i><br><i>Ezequiel Fazio</i></small>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">Consultas</h3>
            <small>Mirá quien envió consultas.</small>
          </div>
        </div>
        <hr>
      </div>
    </div>
    <div class="row">
      {foreach from=$consultas item=consulta key=index}
      <div class="col-md-6">
        <div class="panel panel-filled">
          <div class="panel-heading">Consulta de: {$consulta["nombre"]} <i class="pull-right">{$consulta["mail"]}</i></div>
          <div class="panel-body">
            {$consulta["consulta"]}
          </div>
          <div class="panel-footer"><i>{if !{$consulta["notificacion"]}}No d{else}D{/if}esea recibir notificaciones. </i>
          {if !in_array("eliminar_consulta", $permisos)}
          <a data-id="{$consulta['id_consulta']}" class="eliminarConsulta btn btn-danger btn-xs pull-right">Eliminar</a>
          {/if}
          </div>
        </div>
      </div>
      {/foreach}
      </div>
    </div>
  </div>
</section>
