<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
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
<%
String mensaje = (String)request.getAttribute("MSG-ERROR");
%>

<%
if(mensaje!=null){
%>
<h2><%=mensaje %></h2>
<%	
	
}
if ((session.getAttribute("usuario") == null) || ((Integer)session.getAttribute("usuario") <=0 )){
%>
		<div id = "login" class= "container formularioUsuario">
		<form method ="post" action="login.html" >
			<div class="form-group mt-3">
				<div class="col-12 text-center mb-5">
					<h4>Iniciar sesi&oacute;n</h4>
				</div>
				<input type="hidden" name="url" value="./usuario.jsp">

				<div class="row">
					<div class="col-6 text-right">
						<label for="user">Usuario</label>
					</div>
					<div class="col-6">
						<input id="user" name="user" class="form-control" type="text" required="required">
					</div>
				</div>
				
				<div class="row">
					<div class="col-6 text-right">
						<label for="clave"> Contrase&ntilde;a</label>
					</div>
					<div class="col-6">
						<input id="clave" name="clave" class="form-control" type="password" required="required">
					</div>
				</div>

				<div class="row mb-5">
					<div class="col-6 text-right">
						<input class="btn btn-primary" type="submit" value="Entrar">
					</div>
					<div class="col-6">
						<input class="btn btn-primary" type="button" onclick="window.location.href='/cafeteria-aries/registro.html'" value="Registro">
					</div>
				</div>
			</div>
		</form>	
	</div>
	<% }
		else {
			%>
			<script>
				window.location.href = "/cafeteria-aries/carrito.html";
			</script>
			<%
		}
		//Si existe un usuario, se muestran las opciones del apartado del usuario 
		%>
		
		<div class="mt-5 p-1 bg-dark text-white  cuerpo">
			<mi-pie></mi-pie>
		</div>

		<script src="./js/mis-etiquietas.js"></script>

</body>
</html>