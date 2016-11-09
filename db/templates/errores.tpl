{if $asignados}
<div class="panel panel-filled panel-c-info">
    <div class="panel-heading">
        La conexion fue establecida correctamente.
    </div>
</div>
{elseif !$asignados}
<div class="panel panel-filled panel-c-danger">
    <div class="panel-heading">
        Hubo un error al conectarse.
    </div>
</div>
{/if}
{if isset($db_correcto)}
{if $db_correcto > 0}
<div class="panel panel-filled panel-c-info">
    <div class="panel-heading">
        Se agregaron datos a la base de datos correctamente.
    </div>
</div>
{else}
<div class="panel panel-filled panel-c-danger">
    <div class="panel-heading">
        Hubo un problema al agregar los datos ({$db_correcto})
    </div>
</div>
{/if}
{/if}

{if $asignados}<a href="../index.php" class="btn btn-w-md btn-success btn-block">Ir al inicio</a>{/if}
