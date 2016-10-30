{foreach from=$categorias item=categoria key=index}
{if $index % 2 == 0}<div class="row">{/if}
{if !isset($filtro)}
<div class="col-lg-6 col-xs-12">
    <ul class="list-group">
      <li class="list-group-item active-custom"><strong class="color-white">{$categoria["nombre"]}</strong></a>
      {foreach from=$componentes item=componente}
      {if $componente["fk_id_categoria"] == $categoria["id_categoria"]}
        <li class="list-group-item">{if $componente["destacado"]}<div class="glyphicon glyphicon-ok-sign destacado"></div> {/if}{$componente["nombre"]}<button type="button" class="mostrarComponente btn btn-default btn-xs pull-right space-right" data-id={$componente["id_componente"]}>Ver mas</button></li>
      {/if}
      {/foreach}
    </ul>
</div>
    {else}
    <div class="col-lg-12 col-xs-12">
      <ul class="list-group">
        <li class="list-group-item active-custom"><strong class="color-white">{$categoria["nombre"]}</strong></a>
        {foreach from=$componentes item=componente}
        <li class="list-group-item">{if $componente["destacado"]}<div class="glyphicon glyphicon-ok-sign destacado"></div> {/if}{$componente["nombre"]}<button type="button" class="mostrarComponente btn btn-default btn-xs pull-right space-right" data-id={$componente["id_componente"]}>Ver mas</button></li>

        {/foreach}
      </ul>
    </div>
</div>
{/if}
{if $index % 2 != 0}</div>{/if}


<!-- FILTRO DE CATEGORIAS POR JAVASCRIPT
<div>
  <div class="categoria col-lg-6 col-xs-12">
      <ul class="list-group">
        <li class="list-group-item active-custom"><strong class="color-white" data-id="{$categoria['id_categoria']}">{$categoria["nombre"]}</strong></a>
        {foreach from=$componentes item=componente}
        {if $componente["fk_id_categoria"] == $categoria["id_categoria"]}
        <li class="list-group-item">{if $componente["destacado"]}<div class="glyphicon glyphicon-ok-sign destacado"></div> {/if}{$componente["nombre"]}<a href="index.php?action=mostrar_componente&id={$componente["id_componente"]}"><button type="button" class="btn btn-default btn-xs pull-right">Ver mas</button></a></li>
        {/if}
        {/foreach}
      </ul>
  </div>
</div> -->

{/foreach}
