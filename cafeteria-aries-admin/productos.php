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
      <h3 class="mt-2">A&ntilde;adir productos</h3>
      <form action="./anadir-producto.php" method="POST">
      <table class="tablaModProd">
         <thead>
            <tr>
               <th>Nombre</th>
               <th>Precio</th>
               <th>Ingredientes</th>
               <th>Existencias</th>
               <th>Imagen</th>
               <th>Tipo</th>
               <th>Novedad</th>
               <th>A&ntilde;adir</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>
                     <input type="text" name="nombreA" placeholder="Nombre" required> 
               </td>
               <td>
                     <input type="number" step="0.05" name="precioA"  placeholder="Precio" required>                  
               </td>
               <td>                 
                     <input type="text" name="ingredientesA"  placeholder="Ingredientes">                  
               </td>
               <td>                  
                     <input type="number" name="existenciasA"  placeholder="Existencias" >                  
               </td>
               <td>                  
                     <input type="text" name="imagenA"  placeholder="Imagen" required>                  
               </td>
               <td>                  
                     <select name="tipoA">
                        <option value="bebida">Bebida</option>
                        <option value="aperitivo">Aperitivo</option>
                        <option value="plato">Plato Combinado</option>
                        <option value="bocadillo">Bocadillo</option>
                        <option value="emsalada">Ensalada</option>
                        <option value="pizza">Pizza</option>
                        <option value="hamburguesa">Hamburguesa</option>
                        <option value="postre">Postre</option>
                     </select>                  
               </td>
               <td>
                  
                     <input name="novedadA" type="checkbox" >
                  
               </td>
               <td>
                  
                     <button class="botonAnadir" type="submit" formaction="./anadir-producto.php"><boton-anadir></boton-anadir></button>
                  
               </td>
            </tr>
         </tbody>
      </table>
      </form>


    <h3 class="mt-2">Modificar productos</h3>
   <table class="tablaModProd">
      <thead>
         <tr>
            <th>C&oacute;digo</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Existencias</th>
            <th>Imagen</th>
         </tr>
      </thead>
   <?php
   $resultados = obtenerProductos();
   while ($fila = mysqli_fetch_row($resultados)) {
      $codigo = $fila[0];
   ?>
      <tr>
         <td>
            <form method="POST" onsubmit="return confirm('¿Estás seguro de que quieres eliminar este producto?');">       
               <input type="hidden" name="codigodescripcion" value="<?php echo $codigo; ?>">
               <?php 
                  if(productoEliminable($codigo)){
                     echo('  <button class="botonCambio botonBorrar" type="submit" formaction="./eliminar-producto.php">
                     <boton-borrar></boton-borrar>
                  </button>
                  <label>'. $codigo.'</label>
                  ');
                  }else{
               ?>
               <div style="margin-left:34px;">
                  <label><?php echo $codigo;?></label>
               </div>
               <?php
                  }
               ?>
            </form>
         </td>
         <td>
            <form method="POST" onsubmit="return alert('Se ha actualizado el nombre del producto')">
               <input type="hidden" name="codigodescripcion" value="<?php echo $codigo; ?>">
               <input class="text-center" type="text" value="<?php echo($fila[1]);?>" name="<?php echo $codigo.'desc' ?>" formaction="./modificar-producto.php">
               <button class="botonCambio" type="submit" formaction="./modificar-descripcion.php">
                  <boton-ok></boton-ok>
               </button>
            </form>   
         </td>
         <td>
            <form method="POST" onsubmit="return alert('Se ha actualizado el precio del producto')">
               <input type="hidden" name="codigodescripcion" value="<?php echo $codigo; ?>">
               <input type="number" class="text-center" step="0.05" value="<?php echo $fila[2];?>" name="<?php echo $codigo.'precio' ?>" formaction="./modificar-precio.php">
               <button class="botonCambio" type="submit" formaction="./modificar-precio.php"><boton-ok></boton-ok></button>
            </form>  
         </td>
         <td>
            <form method="POST" onsubmit="return alert('Se han actualizado las existencias del producto')">
               <input type="hidden" name="codigodescripcion" value="<?php echo $codigo; ?>">
               <input type="number" class="text-center" value="<?php echo $fila[3];?>" name="<?php echo $codigo.'stock' ?>" formaction="./modificar-stock.php">
               <button class="botonCambio" type="submit" formaction="./modificar-stock.php"><boton-ok></boton-ok></button>
            </form>
         </td>
         <td>
            <form method="POST"  onsubmit="return alert('Se ha actualizado la imagen del producto')">
               <input type="hidden" name="codigodescripcion" value="<?php echo $codigo; ?>">
               <input type="text" class="text-center" title="INFO: Est&aacute;s modificando el nombre de la imagen, si no coincide con el nombre de una imagen ya existente, eliminar&aacute;s la imagen del producto" value="<?php echo $fila[4];?>" name="<?php echo $codigo.'imagen' ?>" formaction="./modificar-imagen.php">
               <button class="botonCambio" type="submit" formaction="./modificar-imagen.php"><boton-ok></boton-ok></button>
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