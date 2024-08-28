<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigo');

modificarUsuario($codigo, 'telefono', filter_input(INPUT_POST, 'telefono'));

header('Location: usuarios.php');

?>