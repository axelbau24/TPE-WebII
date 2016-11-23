{foreach from=$categorias item=categoria key=index}
{if $index % 2 == 0}<div class="row">{/if}
{if count($categorias) > 1}<div class="col-lg-6 col-xs-12"> {else} <div class="col-lg-12 col-xs-12"> {/if}
    <ul class="list-group">
      <li class="list-group-item active-custom"><strong class="color-white">{$categoria["nombre"]}</strong></a>
      {foreach from=$componentes item=componente}
      {if $componente["fk_id_categoria"] == $categoria["id_categoria"]}
        <li class="list-group-item">{if $componente["destacado"]}<div class="glyphicon glyphicon-ok-sign destacado"></div> {/if}{$componente["nombre"]}
        {if !in_array("mostrar_componente", $permisos)}
        <button type="button" class="mostrarComponente btn btn-default btn-xs pull-right space-right" data-id={$componente["id_componente"]}>Ver mas</button>
        {/if}
        </li>
      {/if}
      {/foreach}
    </ul>
</div>
{if $index % 2 != 0}</div>{/if}
{/foreach}
