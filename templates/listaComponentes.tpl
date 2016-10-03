{if isset($componentes)}
<div class="bs-example"><i>
      <ul>
        {foreach from=$componentes item=componente}
          <li>{$componente["nombre"]} <a href="index.php?action=mostrar_componente&id={$componente["id_componente"]}"><button type="button" class="btn btn-rounded btn-default btn-xs">Ver mas</button></a></li>
        {/foreach}
      </ul>
</i></div>
{/if}
