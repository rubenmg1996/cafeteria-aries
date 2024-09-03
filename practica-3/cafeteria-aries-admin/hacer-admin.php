<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigoAdmin');

$admin = filter_input(INPUT_POST, 'admin');

if($admin == 1){
    modificarUsuario($codigo, 'admin', 0); 
}else{
    modificarUsuario($codigo, 'admin', 1); 
}

header('Location: usuarios.php');

?>