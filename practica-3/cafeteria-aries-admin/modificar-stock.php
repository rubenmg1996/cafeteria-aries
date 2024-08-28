<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigodescripcion');

$codigoDesc = $codigo . 'stock';

modificarProducto($codigo, 'stock', filter_input(INPUT_POST, $codigoDesc));

header('Location: productos.php');

?>