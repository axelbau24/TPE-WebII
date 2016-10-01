<html><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instalación de la base de datos</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body class="blank  pace-done">
<div class="wrapper">
    <section class="content">
        <div class="container-center lg animated slideInDown">
            <div class="view-header">
                <div class="header-title">
                    <h3>Instalación de la base de datos</h3>
                </div>
            </div>

            <div class="panel panel-filled">
                <div class="panel-body">

                    <form action="install.php" method="post">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Host</label>
                                <input type="name" value="" class="form-control" name="host">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Usuario</label>
                                <input type="name" value="" class="form-control" name="user">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Contraseña</label>
                                <input type="password" value=""class="form-control" name="db-pw">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Nombre base de datos</label>
                                <input type="name" value="" class="form-control" name="dbname">
                            </div>
                            <div class="form-group col-lg-12">
                              <div class="checkbox"><label> <input type="checkbox" name="add" value=""> Agregar datos a la base de datos</label></div>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-default">Confirmar</button>
                        </div>
                    </form>
                    {if isset($asignados)}
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
                </div>
            </div>

        </div>
    </section>

</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>



</body>
</html>
