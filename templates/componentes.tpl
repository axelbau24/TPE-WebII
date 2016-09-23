{include file="header.tpl"}

<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <small>Diseñado por:<br><i>Axel Bautista</i><br><i>Ezequiel Fazio</i></small>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">Listado de componentes de PC</h3>
            <small>Listado de diferentes tipos de componentes por categoria.</small>
          </div>
        </div>
        <hr>
      </div>
    </div>
  <div class="row">
    {foreach from=$componentes_cat item=componentes key=categoria}
    <div class="col-lg-6 col-xs-6">
        <ul class="list-group">
          <li class="list-group-item active-custom"><strong class="color-white">{$categoria}</strong></a>
          {foreach from=$componentes item=componente}
          <li class="list-group-item">{if $componente["destacado"]}<div class="glyphicon glyphicon-ok-sign destacado"></div> {/if}{$componente["nombre"]}<a href="verItem.html"><button type="button" class="btn btn-default btn-xs pull-right">Ver mas</button></a></li>
          {/foreach}
        </ul>
    </div>
    {/foreach}
  </div>
</div>
</section>

{include file="footer.tpl"}
