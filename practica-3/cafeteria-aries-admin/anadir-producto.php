<?php

require_once('accesoBD.php');
session_start();

$nombre = filter_input(INPUT_POST, 'nombreA');
$precio = filter_input(INPUT_POST, 'precioA');
$stock = filter_input(INPUT_POST, 'existenciasA');
$imagen = filter_input(INPUT_POST, 'imagenA');
$tipo = filter_input(INPUT_POST, 'tipoA');
$novedad = isset($_POST['novedadA']) ? 1 : 0;
$ingredientes = filter_input(INPUT_POST, 'ingredientesA');

if($stock == null || $stock <= 0){
    $stock = 0;
}

if($precio == null || $nombre == null || $imagen == null || $tipo == null ){
    $_SESSION['error'] = 'No se han rellenado todos los campos necesarios';
    header('Location: anadir-producto.php');
    exit;
}else{
    anyadirProducto($nombre, $precio, $stock, $imagen,  $tipo, $novedad, $ingredientes);
}

header('Location: productos.php');

?>