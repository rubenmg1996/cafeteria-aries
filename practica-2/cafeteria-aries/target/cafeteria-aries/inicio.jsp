<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Inicio</title>
		<link rel="icon" href="media/icono.png" type="image/x-icon">
		<link id="css" href="estilos.css" rel="stylesheet" type="text/css">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	</head>
	<body>
		<header>
			<mi-cabecera></mi-cabecera>
			<mi-menu></mi-menu>
		</header>

		<% 	AccesoBD con=AccesoBD.getInstance();
       		boolean res=con.comprobarAcceso();
    	%>



                <h2 style="margin-top: 8px;"> Nuestras Novedades </h2>

		
		
			<%

	AccesoBD bbdd = AccesoBD.getInstance();
	List<ProductoBD> productos = (List<ProductoBD>)request.getAttribute("productos-nuevos");
	


	for(int i = 0; productos != null && i < productos.size(); i++){
		
			ProductoBD prod = productos.get(i);
			String idNum = "prod" + i;
			
	%>
	
	<%} %>
			<div class="contenedorSlider">
				<ul class="slider">
	
		

	<%

	for(int i = 0; productos != null && i < productos.size(); i++){
		
			ProductoBD prod = productos.get(i);
			String idNum = "prod" + i;
			
	%>
		
				<li id="<%=idNum %>">
					<img alt="imagen" src=<%= "media/" + prod.getImagen()  %>>
					<div class="image-text">
						<h2><%=prod.getDescripcion() %></h2>
					</div>
				</li>				
				
				
	<%
	}
	%>
				
			</ul>
			<ul class="menu">
			<%
	
	for(int i = 0; productos != null && i < productos.size(); i++){
		
			ProductoBD prod = productos.get(i);
			String idNum = "prod" + i;
	
	%>
			
				<li>
					<a href=#<%=idNum %>></a>
				</li>
				<%
				}
				%>
			</ul>
		</div>
		
				<p>
			Haz tu pedido para recoger o para comer aqu&iacute; a trav&eacute;s de esta web.
		</p>
		<p>
			Tambi&eacute;n puedes contactar con nosotros a trav&eacute;s de redes o por tel&eacute;fono, todo disponible en la secci&oacute;n de contacto.
		</p>
		<div class="mt-5 p-1 bg-dark text-white  cuerpo">
			<mi-pie></mi-pie>
		</div>		
		

		<script src="./js/mis-etiquietas.js"></script>
	</body>
</html>