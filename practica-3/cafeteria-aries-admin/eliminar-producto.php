<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigodescripcion');



eliminarProducto($codigo);
header('Location: productos.php');

?>