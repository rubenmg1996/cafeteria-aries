<?php require_once('accesoBD.php'); ?>

<!DOCTYPE html>
<html lang="es">
<head>
   <title>Iniciar sesión</title>
   <link id="css" href="estilos.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <header>
        <mi-cabecera-admin-login></mi-cabecera-admin-login>
    </header>
    <?php session_start();?>
    <?php if(isset($_SESSION['msg'])){ ?>
    <h2 class="mt-2"> <?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?> </h2>
    <?php } ?>
    <div class="container formularioUsuario mt-4">
		<form action="./login-control.php" method="post">
			<div class="form-group mt-3">
				<div>
					<div class="col-12 text-center mb-5">
						<h4>Iniciar sesi&oacute;n</h4>
                    </div>

                    <div class="row">
						<div class="col-6 pt-3 text-right">
                            <label>Nombre de usuario:</label>
                        </div>   
                        <div class="col-6">
                            <input type="text" class="form-control bg-light mb-2 mt-2" name="usuario" placeholder="Nombre de usuario">
                        </div>
                    </div>
					<div class="row">
						<div class="col-6 pt-3 text-right">
                            <label>Contrase&ntilde;a:</label>
                        </div>   
                        <div class="col-6">
                            <input type="password" class="form-control bg-light mb-2 mt-2" name="clave" placeholder="Contrase&ntilde;a">
                        </div>
					</div>
                    <div class="row mb-5">
						<div class="col text-center">
                            <input type="submit" class="btn btn-primary mt-2" value="Iniciar sesi&oacute;n">
                        </div>
                    </div>
				</div>
			</div>
		</form>
	</div>
	<div class="mt-5 p-1 bg-dark text-white cuerpo">
		<mi-pie></mi-pie>
	</div>
   <script src="./mis-etiquetas.js"></script>
</body>
</html>
