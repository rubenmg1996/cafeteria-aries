<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro</title>
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

	<div class="col-12 text-center mt-3 mb-2"><h3>Crear nueva cuenta</h3></div>
	
<% 
	AccesoBD acceso = AccesoBD.getInstance();
	String mensaje = (String)request.getAttribute("MSG-ERROR");

	if(mensaje!=null){
%>
	<h2><%=mensaje %></h2>
<%	
	}
%>
	<div class="container">
	<div class="container formularioUsuario">
		<form method ="post" action="registro.html">
			<div class="form-group mt-3">
				<label for="usuario"> Nombre de usuario: </label>	
				<input type="text" id="usuario"  class="form-control bg-light" name="usuario" autofocus="autofocus" required="required" placeholder="Nombre de usuario">
			</div>
			<br>
			<div class="form-group mt-2">
				<label for="contrasena"> Contrase&ntilde;a: </label>	
				<input type="password" class="form-control bg-light" id="contrasena" name="contrasena" required="required" placeholder="Contrase&ntilde;a">
			</div>
			<br>
			<div class="form-group mt-2">
				<label for="nombre"> Nombre y apellidos </label>
				<input type="text" class="form-control bg-light" id="nombre" name="nombre" required="required" placeholder="Nombre y apellidos">
			</div>
			<br>
			<div class="form-group mt-2">
				<label for="correo"> Correo electr&oacute;nico: </label>
				<input type="email" class="form-control bg-light" id="correo" name="correo" required="required" placeholder="Correo electr&oacute;nico">
			</div>	
			<br>
			<div class="form-group mt-2">
				<label for="telefono"> Tel&eacute;fono: </label>
				<input type="tel" class="form-control bg-light" id="telefono" name="telefono" required="required" placeholder="Tel&eacute;fono">
			</div>
			<br>
			<div class="form-group mt-2">
				<label for="dir"> Direcci&oacute;n: </label>
				<input type="text" class="form-control bg-light" id="direccion" name="direccion" placeholder="Direcci&oacute;n">
			</div>
			<br>
			<input type="submit" class="btn btn-primary mb-2 mt-2" value="Registrarse" onclick="Cargar('login.html', 'login');">
	</form>
</div>	
	</div>
	<div id="usuario"></div>

	<div class="mt-5 p-1 bg-dark text-white  cuerpo">
		<mi-pie></mi-pie>
	</div>

	<script src="./js/mis-etiquietas.js"></script>
</body>
</html>