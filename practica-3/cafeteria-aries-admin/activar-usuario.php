<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigo');

$activo = filter_input(INPUT_POST, 'activo');

if($activo == 1){
    modificarUsuario($codigo, 'activo', 0); 
}else{
    modificarUsuario($codigo, 'activo', 1); 
}

header('Location: usuarios.php');

?>