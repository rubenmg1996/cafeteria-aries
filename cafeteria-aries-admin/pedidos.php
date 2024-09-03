<?php require_once('accesoBD.php'); ?>
<?php session_start();?>
<?php
   if (isset($_SESSION['userid']) and $_SESSION['admin'] == 1) {

      $userid = $_SESSION['userid'];
      
      if(isset($_SESSION['filtro'])){
      if($_SESSION['filtro'] == 0 )
      {
        $resultado = obtenerPedidos();
      }else if($_SESSION['filtro'] == 1)
      {
        if(isset($_SESSION['usuario-filtro'])){
            $resultado = obtenerPedidosUsuario($_SESSION['usuario-filtro']);
            $mensaje_filtro = ' del usuario '.$_SESSION['usuario-filtro'];
      }else
            $resultado = obtenerPedidos();
      }else if($_SESSION['filtro'] == 2)
      {
        if(isset($_SESSION['fecha-filtro']) && isset($_SESSION['opcion-fecha'])){
            $resultado = obtenerPedidosFecha($_SESSION['fecha-filtro'], $_SESSION['opcion-fecha']);
            if($_SESSION['opcion-fecha'] == 0){
                $mensaje_filtro = ' con fecha igual a '.$_SESSION['fecha-filtro'];
            }else if($_SESSION['opcion-fecha'] == 1){
                $mensaje_filtro = ' con fecha anterior a '.$_SESSION['fecha-filtro'];
            }else if($_SESSION['opcion-fecha'] == 2){
                $mensaje_filtro = ' con fecha posterior a '.$_SESSION['fecha-filtro'];
            }
        }else   
            $resultado = obtenerPedidos();
        
      }else if($_SESSION['filtro'] == 3)
        {
            if(isset($_SESSION['producto-filtro'])){
                $resultado = obtenerPedidosProducto($_SESSION['producto-filtro']);
                $mensaje_filtro = ' que contienen el producto '.$_SESSION['producto-filtro'];
            }else
            $resultado = obtenerPedidos();
        }
      
    }else{
        $resultado = obtenerPedidos();
    }
      
 
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
    <?php
    if(isset($mensaje_filtro)){
        echo '<h3 class="mt-2">Pedidos'.$mensaje_filtro.'</h3>';
    }else{
        ?>
    <h3 class="mt-2">Pedidos</h3>

    <?php
    } ?>
    <div class="text-center">
        <button class="col-2 btn btn-primary" onclick="mostrarFiltro()" id="botonFiltro">Filtrar</button>
    <div class="container formularioFiltro" id="formularioFiltro">
        <form method="POST" action="./filtrar-pedidos.php" class="d-flex"> 
            <div class="col-10">
            <div class="form-group">
                <div class="row">
                    <input type="checkbox" id="checktodos" name="checktodos" value="1" onclick="checkOnlyOne(this)" >
                    <label>Ver todos</label>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <input type="checkbox" id="checkusuario" name="checkusuario" value="1" onclick="checkOnlyOne(this)" >
                    <label>Usuario</label>
                    <input type="number" name="usuario" placeholder="Codigo">
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <input type="checkbox" id="checkfecha" name="checkfecha" value="1" onclick="checkOnlyOne(this)"  >
                    <label>Fecha</label>
                    <input type="date" name="fecha" placeholder="Fecha">
                    <select class="ml-2" name="opcionFecha">
                        <option value="0">Igual</option>
                        <option value="1">Anterior</option>
                        <option value="2">Posterior</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <input type="checkbox" id="checkproducto" name="checkproducto" value="1" onclick="checkOnlyOne(this)" >
                    <label>Producto</label>
                    <input type="number" name="producto" placeholder="Codigo">
                </div>
            </div>
            </div>
            <div class="col-2 d-flex justify-content-end align-items-end text-end">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </form>
    </div>
    <div>
    <script>

        var $boton = document.getElementById('botonFiltro');
        var $div = document.getElementById('formularioFiltro');

        $div.style.display = 'none';

        function mostrarFiltro() {
            if($div.style.display == 'none') {
                $div.style.display = 'block';
            } else {
                $div.style.display = 'none';
            }
        }

        function checkOnlyOne(box) {
            var checkboxes = [];
            checkboxes[0] = document.getElementById('checkusuario');
            checkboxes[1] = document.getElementById('checkfecha');
            checkboxes[2] = document.getElementById('checkproducto');
            checkboxes[3] = document.getElementById('checktodos');

            checkboxes.forEach((item) => {
                if (item !== box) item.checked = false;
            })
        }

    </script>
    

    </div>

    <table class="tablaModProd">
      <thead>
         <tr>
            <th></th>
            <th>Usuario : C&oacute;digo</th>
            <th>Fecha</th>
            <th>Precio total</th>
            <th>Estado</th>
         </tr>
      </thead>
   <?php
   while ($fila = mysqli_fetch_row($resultado)) {
        $codigo = $fila[0];
        $codUsu = $fila[1];
        $fecha = $fila[2];
        $precio = $fila[3];
        $estado = $fila[4];
        if($estado == 0 || $estado == null){
            $estadoString = "Pendiente";
        }else if($estado == 1){
            $estadoString = "Preparando";
        }else if($estado == 2){
            $estadoString = "Listo";
        }else if($estado == 3){
            $estadoString = "Recogido"; 
        }

        $res_usuario = obtenerUsuario($codUsu);
        $usuario = mysqli_fetch_row($res_usuario)[3];

   ?>
        <tr>
             <td class="text-center">
             <form method="POST" action="./detalle-pedido.php">
                <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
                <input type="hidden" name="codUsu" value="<?php echo $codUsu; ?>">
                <input type="hidden" name="fecha" value="<?php echo $fecha; ?>">
                <input type="hidden" name="precio" value="<?php echo $precio; ?>">
                <input type="hidden" name="estado" value="<?php echo $estado; ?>">                
                <button type="submit" class="btn btn-primary">Ver detalles</button>
             </form>
             </td>
             <td class="text-center"><?php echo $usuario.' : '. $codUsu;?></td>
             <td class="text-center"><?php echo $fecha;?></td>
             <td class="text-center"><?php echo $precio.' &euro;';?></td>
             <td class="text-center">
                <form method="POST" action="./cambiar-estado-pedido.php" onsubmit="return alert('Se ha modificado el estado del pedido');">
                    <input type="hidden" name="codigo" value="<?php echo $codigo; ?>">
                    <select name="estado">
                        <option value="0" <?php if($estado == 0 or $estado == null) echo 'selected' ?>>Pendiente</option>
                        <option value="1" <?php if($estado == 1) echo 'selected' ?>>Preparando</option>
                        <option value="2" <?php if($estado == 2) echo 'selected' ?>>Listo</option>
                        <option value="3" <?php if($estado == 3) echo 'selected' ?>>Recogido</option>
                    </select>
                <button class="botonCambio" type="submit"><boton-ok></boton-ok></button>
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