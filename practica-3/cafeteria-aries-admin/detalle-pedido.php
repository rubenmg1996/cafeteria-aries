<?php require_once('accesoBD.php'); ?>
<?php session_start();?>
<?php
   if (isset($_SESSION['userid']) and $_SESSION['admin'] == 1) {

      $userid = $_SESSION['userid'];

        $codigo = filter_input(INPUT_POST, 'codigo');
        $codUsuario = filter_input(INPUT_POST, 'codUsu');
        $estado = filter_input(INPUT_POST, 'estado');
        $precio = filter_input(INPUT_POST, 'precio');

        $resultado = obtenerPedido($codigo); 
 
?>
<!DOCTYPE html>
<html lang="es">
<head>
   <title>Pedidos</title>
   <link id="css" href="estilos.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
   <header>
        <mi-cabecera-admin></mi-cabecera-admin>
        <mi-menu-admin></mi-menu-admin>
    </header>

    <h2 class="mt-2">Detalle del pedido </h2>
    <h3>C&oacute;digo pedido: <?php echo $codigo ?></h3>
    
    <table class="col-8 tablaModProd">
        <thead>
            <tr>
                <th>Producto</th>
                <th>Unidades</th>
                <th>Precio / u</th>
                <th>Precio total</th>
            </tr>
        </thead>
<?php 


   while ($fila = mysqli_fetch_row($resultado)) {

    $producto = mysqli_fetch_row ( obtenerProducto($fila[1]))[1];   
?>
        
        <tr>

             <td class="text-center"><?php echo $producto ?></td>
             <td class="text-center"><?php echo $fila[2]?></td>
             <td class="text-center"><?php echo $fila[3]. ' &euro;'?></td>
             <td class="text-center"><?php echo number_format($fila[3] * $fila[2], 2) . ' &euro;';?>
                
            </td>
        </tr>

<?php
   }

?>

<tfoot>
    <tr>
        <td class="text-center" colspan="3">Precio total:</td>
        <td class="text-center"><?php echo $precio . ' &euro;'?></td>
    </tr>
</tfoot>
<?php
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