<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="media/icono.png" type="image/x-icon">
<link id="css" href="estilos.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Carrito</title>
</head>
<body>
	<header>
		<mi-cabecera></mi-cabecera>
		<mi-menu></mi-menu>
	</header>

	<h2>Carrito</h2>
	<div id="cuerpoCarrito">
	<table id="tablaCompleta" class="tablaCarrito">
	<thead>
		<tr>
			<td>Producto</td>
			<td>Precio / unidad</td>
			<td>Cantidad</td>
			<td>Precio total</td>
			<td></td>
		</tr>
	</thead>
	<tbody id="tablaCarrito">
		<tr><td></td><td></td><td></td><td></td></tr>
	</tbody>
	<tfoot>
    	<tr>
    		<td>Precio total</td><td></td><td></td><td id="TotalCarrito"></td><td></td>
        </tr>
    </tfoot>
</table>

<% 
AccesoBD acceso = AccesoBD.getInstance();

int codUsu = (Integer)request.getSession().getAttribute("usuarioCodigo");

if ((session.getAttribute("usuarioCodigo") == null) || codUsu <=0 ){%>

	
 <h4>Inicia sesi&oacute;n para realizar la compra</h4>
 
  <%}

else{

codUsu = (Integer)request.getSession().getAttribute("usuarioCodigo");

UsuarioBD usu = acceso.VerUsuarios(codUsu);
%>


<form id="formulario">
  <input type="submit" class="botonPedido" onclick=" EnviarCarrito('carrito.html', 'cuerpoCarrito', carrito); limpiarCarrito();
  alert('Pedido realizado. Puedes revisar el estado de tu pedido en Usuario -> Pedidos')" value="Realizar pedido" >
</form>

</div>


<%} %>

<div class="mt-5 p-1 bg-dark text-white  cuerpo">
	<mi-pie></mi-pie>
</div>
<script src="./js/carrito.js"></script>
<script>mostrarCarrito();</script>
<script src="./js/mis-etiquietas.js"></script>
<script src="./js/libjson.js"></script>
</body>
</html>