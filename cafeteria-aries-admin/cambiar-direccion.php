<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigo');

modificarUsuario($codigo, 'direccion', filter_input(INPUT_POST, 'direccion'));

header('Location: usuarios.php');

?>