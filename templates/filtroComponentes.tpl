{if isset($componentes)}
<div class="bs-example"><i>
      <ul>
        {foreach from=$componentes item=componente}
          <li>{$componente["nombre"]} <button type="button" class="btn btn-rounded btn-default btn-xs mostrarComponente" data-id={$componente["id_componente"]}>Ver mas</button></li>
        {/foreach}
      </ul>
</i></div>
{/if}
