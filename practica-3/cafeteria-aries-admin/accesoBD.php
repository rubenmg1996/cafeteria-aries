<?php

function conectar() {
   $bbdd = mysqli_connect("localhost","root","DawLab","bbddbar");
   if (mysqli_connect_error()) {
      printf("Error conectando a la base de datos: %s\n",mysqli_connect_error());
      exit();
   }
   return $bbdd;
}

function desconectar($bbdd) {
   mysqli_close($bbdd);
}



function obtenerProductos() {
   $bbdd = conectar();
   $consulta = "SELECT * FROM productos";
   $resultado = mysqli_query($bbdd,$consulta);
   desconectar($bbdd);
   return $resultado;
}

function obtenerProducto($codigo)
{
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"SELECT * FROM productos WHERE codigo = ?");
   mysqli_stmt_bind_param($consulta, 's', $codigo);
   mysqli_stmt_execute($consulta);
   $resultado = mysqli_stmt_get_result($consulta);
   desconectar($bbdd);
   return $resultado;
}

function modificarProducto($codigo, $campo, $valor) {
   $bbdd = conectar();

   if($campo == 'descripcion'){
      $consulta = mysqli_prepare($bbdd,"UPDATE productos SET descripcion = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ss', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'precio'){
      $consulta = mysqli_prepare($bbdd,"UPDATE productos SET precio = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ds', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'stock'){
      $consulta = mysqli_prepare($bbdd,"UPDATE productos SET existencias = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'is', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'imagen'){
      $consulta = mysqli_prepare($bbdd,"UPDATE productos SET imagen = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ss', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }
   
   desconectar($bbdd);
   return $result;
}

function eliminarProducto($codigo) {
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"DELETE FROM productos WHERE codigo = ?");
   mysqli_stmt_bind_param($consulta, 's', $codigo);
   $result = mysqli_stmt_execute($consulta);
   desconectar($bbdd);
   return $result;
}

function anyadirProducto($nombre, $precio, $stock, $imagen,  $tipo, $novedad, $ingredientes) {
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"INSERT INTO productos (descripcion, precio, existencias, imagen, tipo, novedad, ingredientes) VALUES (?, ?, ?, ?, ?, ?, ?)");
   mysqli_stmt_bind_param($consulta, 'sdissis', $nombre, $precio, $stock, $imagen, $tipo, $novedad, $ingredientes);
   $result = mysqli_stmt_execute($consulta);
   desconectar($bbdd);

   echo 'alert("Producto añadido correctamente");';
   return $result;
}

function productoEliminable($codigo) {
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"SELECT COUNT(*) FROM detalle WHERE codigo_producto = ?");
   mysqli_stmt_bind_param($consulta, 's', $codigo);
   mysqli_stmt_execute($consulta);
   mysqli_stmt_bind_result($consulta, $numPedidos);
   mysqli_stmt_fetch($consulta);
   desconectar($bbdd);
   return $numPedidos == 0;
}

function obtenerUsuarios() {
   $bbdd = conectar();
   $consulta = "SELECT * FROM usuarios";
   $resultado = mysqli_query($bbdd,$consulta);
   desconectar($bbdd);
   return $resultado;
}

function obtenerUsuario($codigo)
{
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"SELECT * FROM usuarios WHERE codigo = ?");
   mysqli_stmt_bind_param($consulta, 's', $codigo);
   mysqli_stmt_execute($consulta);
   $resultado = mysqli_stmt_get_result($consulta);
   desconectar($bbdd);
   return $resultado;

}

function usuarioEliminable($codigo) {
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"SELECT COUNT(*) FROM pedidos WHERE persona = ?");
   mysqli_stmt_bind_param($consulta, 's', $codigo);
   mysqli_stmt_execute($consulta);
   mysqli_stmt_bind_result($consulta, $numPedidos);
   mysqli_stmt_fetch($consulta);
   desconectar($bbdd);
   return $numPedidos == 0;
}

function eliminarUsuario($codigo) {
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"DELETE FROM usuarios WHERE codigo = ?");
   mysqli_stmt_bind_param($consulta, 's', $codigo);
   $result = mysqli_stmt_execute($consulta);
   desconectar($bbdd);
   return $result;
}

function modificarUsuario($codigo, $campo, $valor) {
   $bbdd = conectar();

   if($campo == 'activo'){
      $consulta = mysqli_prepare($bbdd,"UPDATE usuarios SET activo = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'is', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'admin'){
      $consulta = mysqli_prepare($bbdd,"UPDATE usuarios SET admin = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'is', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'direccion'){
      $consulta = mysqli_prepare($bbdd,"UPDATE usuarios SET direccion = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ss', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'correo'){
      $consulta = mysqli_prepare($bbdd,"UPDATE usuarios SET email = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ss', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }

   if($campo == 'telefono'){
      $consulta = mysqli_prepare($bbdd,"UPDATE usuarios SET telefono = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ss', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
   }
   
   desconectar($bbdd);
   return $result;
}

function obtenerPedidos() {
   $bbdd = conectar();
   $consulta = "SELECT * FROM pedidos";
   $resultado = mysqli_query($bbdd,$consulta);
   desconectar($bbdd);
   return $resultado;
}

function obtenerPedidosUsuario($codigousuario)
{
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE persona = ?");
   mysqli_stmt_bind_param($consulta, 'i', $codigousuario);
   mysqli_stmt_execute($consulta);
   $resultado = mysqli_stmt_get_result($consulta);
   desconectar($bbdd);
   return $resultado;
}

function obtenerPedidosFecha($fecha, $opcion)
{
   $bbdd = conectar();
   if($opcion == 0){
      $consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE fecha = ?");
   }else if($opcion == 2){
      $consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE fecha >= ?");
   }else if($opcion == 1){
      $consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE fecha <= ?");
   }
   mysqli_stmt_bind_param($consulta, 's', $fecha);
   mysqli_stmt_execute($consulta);
   $resultado = mysqli_stmt_get_result($consulta);
   desconectar($bbdd);
   return $resultado;
}  

function obtenerPedidosProducto($codigoproducto)
{
    $bbdd = conectar();

    $consulta = mysqli_prepare($bbdd, "SELECT pedidos.* FROM pedidos INNER JOIN detalle ON pedidos.codigo = detalle.codigo_pedido WHERE detalle.codigo_producto = ?");
    mysqli_stmt_bind_param($consulta, 'i', $codigoproducto);
    mysqli_stmt_execute($consulta);

    $resultado = mysqli_stmt_get_result($consulta);

    desconectar($bbdd);

    return $resultado;
}

function modificarPedido($codigo, $campo, $valor)
{
   if($campo == 'estado'){
      $bbdd = conectar();
      $consulta = mysqli_prepare($bbdd,"UPDATE pedidos SET estado = ? WHERE codigo = ?");
      mysqli_stmt_bind_param($consulta, 'ss', $valor, $codigo);
      $result = mysqli_stmt_execute($consulta);
      desconectar($bbdd);
      return $result;
   }
}

function obtenerPedido($codigo)
{
   $bbdd = conectar();
   $consulta = mysqli_prepare($bbdd,"SELECT * FROM detalle WHERE codigo_pedido = ?");
   mysqli_stmt_bind_param($consulta, 'i', $codigo);
   mysqli_stmt_execute($consulta);
   $resultado = mysqli_stmt_get_result($consulta);
   
   return $resultado;

   desconectar($bbdd);
}

?>