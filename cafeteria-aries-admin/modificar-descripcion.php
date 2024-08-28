<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigodescripcion');

$codigoDesc = $codigo . 'desc';

modificarProducto($codigo, 'descripcion', filter_input(INPUT_POST, $codigoDesc));

header('Location: productos.php');

?>