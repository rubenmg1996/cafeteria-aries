<?php

require_once('accesoBD.php');
session_start();

$codigo = filter_input(INPUT_POST, 'codigo');

$estado = filter_input(INPUT_POST, 'estado');

modificarPedido($codigo, 'estado', $estado);

if(filter_input(INPUT_POST, 'estoyEnDetalle') == '1'){
    header('Location: ./detalle-pedido.php?codigo=' . $codigo);    
}else{
    header('Location: ./pedidos.php');
}
?>