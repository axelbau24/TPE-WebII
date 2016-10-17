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
                    <form class="database" method="post">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Host</label>
                                <input type="name" value="" class="form-control" name="host" required>
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Usuario</label>
                                <input type="name" value="" class="form-control" name="user" required>
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Contraseña</label>
                                <input type="password" value=""class="form-control" name="db-pw">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Nombre base de datos</label>
                                <input type="name" value="" class="form-control" name="dbname" required>
                            </div>
                            <div class="form-group col-lg-12">
                              <div class="checkbox"><label> <input type="checkbox" name="vaciar" value=""> Vaciar base de datos</label></div>
                              <div class="checkbox"><label> <input type="checkbox" name="add" value=""> Agregar datos a la base de datos</label></div>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-default">Confirmar</button>
                        </div>
                    </form>
                    <div class="errors"> </div>
                </div>
            </div>

        </div>
    </section>

</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>


</body>
</html>
