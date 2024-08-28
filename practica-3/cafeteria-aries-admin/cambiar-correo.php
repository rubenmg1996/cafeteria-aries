<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigo');

modificarUsuario($codigo, 'correo', filter_input(INPUT_POST, 'correo'));

header('Location: usuarios.php');

?>