<?php

require_once('accesoBD.php');
session_start();

$checkusu = filter_input(INPUT_POST, 'checkusuario');
$checkfecha = filter_input(INPUT_POST, 'checkfecha');
$checkproducto = filter_input(INPUT_POST, 'checkproducto');
$checktodos = filter_input(INPUT_POST, 'checktodos');

$codUsu = filter_input(INPUT_POST, 'usuario');
$fecha = filter_input(INPUT_POST, 'fecha');
$producto = filter_input(INPUT_POST, 'producto');

$opcion = filter_input(INPUT_POST, 'opcionFecha');

echo 'Valores checks: '.$checkusu.' '.$checkfecha.' '.$checkproducto.';';


if($checktodos=='1')
{
    $_SESSION['filtro'] = 0;
    
}
if($checkusu == '1')
{
    $_SESSION['filtro'] = 1;    
    $_SESSION['usuario-filtro'] = $codUsu;

}else if($checkfecha == 1)
{
    $_SESSION['filtro'] = 2;
    $_SESSION['fecha-filtro'] = $fecha;
    $_SESSION['opcion-fecha'] = $opcion;

}else if($checkproducto == 1)
{   

    $_SESSION['filtro'] = 3;
    $_SESSION['producto-filtro'] = $producto;
}

header('Location: pedidos.php');

?>