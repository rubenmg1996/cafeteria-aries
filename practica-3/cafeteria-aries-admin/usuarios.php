<?php require_once('accesoBD.php'); ?>
<?php session_start();?>
<?php
   unset($_SESSION['filtro']);
   if (isset($_SESSION['userid']) and $_SESSION['admin'] == 1) {

      $userid = $_SESSION['userid'];
 
?>
<!DOCTYPE html>
<html lang="es">
<head>
   <title>Modificar productos</title>
   <link id="css" href="estilos.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
   <header>
        <mi-cabecera-admin></mi-cabecera-admin>
        <mi-menu-admin></mi-menu-admin>
    </header>

    <h3 class="mt-2">Usuarios</h3>
    <table class="tablaModProd">
      <thead>
         <tr>
            <th>Nombre de usuario</th>
            <th>Nombre</th>
            <th>Activo</th>
            <th>Admin</th>
            <th>Direcci&oacute;n</th>
            <th>Correo</th>
            <th>Telefono</th>
         </tr>
      </thead>
   <?php
   $resultados = obtenerUsuarios();
   while ($fila = mysqli_fetch_row($resultados)) {
        $codigo = $fila[0];
        $activo = $fila[1];
        $admin = $fila[2];
        $nombreUsu = $fila[3];
        $nombre = $fila[5];
        $direccion = $fila[7];
        $correo = $fila[12];
        $telefono = $fila[11];

        $borrable = usuarioEliminable($codigo);
   ?>
      <tr>
         <td>
         <form method="POST" class="flex-container" onsubmit="return confirm('¿Estás seguro de que quieres eliminar este usuario?');">
            <label><?php echo $nombreUsu;?></label>
            <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
            <?php
            if($borrable) {
                echo('
                    <button class="botonCambio botonBorrar" type="submit" formaction="./eliminar-usuario.php">
                  <boton-borrar></boton-borrar>
               </button>
                </form>
                ');
            }else{
                echo('
                </form>
                ');
            }
            ?>
         </td>
         <td>
            <label><?php echo $nombre;?></label>
         </td>
         <td>
            <form method="POST" class="flex-container">
               <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
               <input type="hidden" name="activo" value="<?php echo $activo; ?>">
               <?php 
                if ($activo == 1) {
                    echo '<label>S&iacute;</label>
                    <button class="botonCambio botonBorrar" title="Desactivar" type="submit" formaction="./activar-usuario.php"><boton-x></boton-x></button>';
                } else {
                    echo '<label>No</label>
                    <button class="botonCambio" title="Activar" type="submit" formaction="./activar-usuario.php"><boton-ok></boton-ok></button>';
                }
               ?>
            </form>  
         </td>
         <td>
            <form method="POST" class="flex-container">
               <input type="hidden" name="codigoAdmin" value="<?php echo $codigo; ?>">
               <input type="hidden" name="admin" value="<?php echo $admin; ?>">
                <?php 
                 if ($admin == 1) {
                      echo '<label style="height:100%">S&iacute;</label>';
                      
                 } else {
                      echo '<label>No</label>
                      <button class="botonCambio" title="Hacer administrador de la web" type="submit" formaction="./hacer-admin.php"><boton-ok></boton-ok></button>';
                 } ?>
            </form>
         </td>
         <td>
            <form method="POST">
               <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
               <input type="text" value="<?php echo $direccion;?>" name="direccion" formaction="./cambiar-direccion.php">
               <button class="botonCambio" type="submit" formaction="./cambiar-direccion.php"><boton-ok></boton-ok></button>
            </form> 
         </td>
        <td>
            <form method="POST">
               <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
               <input type="text" value="<?php echo $correo;?>" name="correo" formaction="./cambiar-correo.php">
               <button class="botonCambio" type="submit" formaction="./cambiar-correo.php"><boton-ok></boton-ok></button>
            </form> 
        </td>
        <td>
            <form method="POST">
                <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
                <input type="text" value="<?php echo $telefono;?>" name="telefono" formaction="./cambiar-telefono.php">
                <button class="botonCambio" type="submit" formaction="./cambiar-telefono.php"><boton-ok></boton-ok></button>
            </form>
        </td>
        
      </tr>
   <?php
   }
} else {
   header('Location: ./index.php');
}
   ?>
   </table>
   
   <div class="mt-5 p-1 bg-dark text-white cuerpo">
		<mi-pie></mi-pie>
	</div>
   <script src="./mis-etiquetas.js"></script>
</body>
</html>