
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="view-header">
          <div class="pull-right text-right" style="line-height: 14px">
            <strong class="pull-left">Filtrar categorías</strong><br>
            <select name="categoria" class="categorias form-control">
              <option value="0">Todos</option>
              {foreach from=$categorias item=categoria}
              <option value="{$categoria['id_categoria']}">{$categoria["nombre"]}</option>
              {/foreach}
            </select>
          </div>

          <div class="header-title">
            <h3 class="m-b-xs">Listado de componentes de PC</h3>
            <small>Listado de diferentes tipos de componentes por categoria.</small>
          </div>
        </div>
        <hr>
      </div>
    </div>
    <div class="contenido-componentes">
      {include file="componentesCategoria.tpl"}
    </div>

</section>
