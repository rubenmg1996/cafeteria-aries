<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigo');

eliminarUsuario($codigo);

header('Location: usuarios.php');

?>