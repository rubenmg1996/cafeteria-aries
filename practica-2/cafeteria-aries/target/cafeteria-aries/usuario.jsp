<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Usuario</title>
<link rel="icon" href="media/icono.png" type="image/x-icon">
<link id="css" href="estilos.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body onload="ocultarForms(); ocultarPedidos(); ">
	<header>
		<mi-cabecera></mi-cabecera>
		<mi-menu></mi-menu>
	</header>
	<%
    AccesoBD acceso = AccesoBD.getInstance();
    
    int codUsu = (Integer)request.getSession().getAttribute("usuarioCodigo");
    
    UsuarioBD usu = acceso.VerUsuarios(codUsu);
    
    String cambioContrasena = (String)request.getAttribute("cambio");
%>

	<div class="user-container mt-2">
		<h2><%= usu.getUsuario()  %></h2>
		<p><%= "Nombre: " + usu.getNombre() %></p>
		<p><%= "Direccion: " + usu.getDireccion() %></p>
		<p><%= "Teléfono: " + usu.getTelefono() %></p>
		<p><%= "Correo electrónico: " + usu.getCorreo()  %></p>
		
		<div class="row">
			<div class="col-4 text-center">
				<button class="btn btn-primary" id="botonPedidos" onclick="verPedidos(); ">Ver pedidos</button>
			</div>
			<div class="col-4 text-center">
				<button class="btn btn-primary" id="botonFormularios" onclick="verForms();">Modificar datos</button>
			</div>
			<div class="col-4 text-center">
				<form method="post" action="usuario.html">
						<button class="btn btn-primary" type="submit">Cerrar sesi&oacute;n</button>
				</form>
			</div>
		</div>
	</div>

	<div id="pedidos" class="row m-2 formulario-oculto">
        <% 
			
            HashMap<Integer, ArrayList<ArrayList<String>>> detallesPorPedido = (HashMap<Integer, ArrayList<ArrayList<String>>>) request.getAttribute("detallesPorPedido");
				
			
            if (detallesPorPedido != null && !detallesPorPedido.isEmpty()) {
                for (int codigoPedido : detallesPorPedido.keySet()) {
                    ArrayList<ArrayList<String>> detalles = detallesPorPedido.get(codigoPedido);
                    String precioTotal = calcularPrecioTotal(detalles);

					PedidoBD pedido = acceso.obtenerPedido(codigoPedido);
                    
                    if (!detalles.isEmpty()) { // Evitar tickets vacíos

        %>
		<%! 
    public String calcularPrecioTotal(ArrayList<ArrayList<String>> detalles) {
        float total = 0;
        for (ArrayList<String> detalle : detalles) {
            total += Float.parseFloat(detalle.get(1)) * Integer.parseInt(detalle.get(2));
        }
        return String.valueOf(total);
    }

	public String cambiaFormatoFecha(String fecha)
	{
		String[] fechaArray = fecha.split("-");
		return fechaArray[2] + "/" + fechaArray[1] + "/" + fechaArray[0];
	}
%>


        <div class="col-12 col-sm-6 ticket">

			<h3>Ticket Pedido: <%= codigoPedido %></h3>
			<h4><%= cambiaFormatoFecha(pedido.getFecha().toString()) %></h4>

			<% 
			
				if(pedido.getEstado() == null || Integer.parseInt(pedido.getEstado()) == 0) { %>
					<h4 style="color:#FF8C00">Pendiente </h4>
				<% } else if(Integer.parseInt(pedido.getEstado()) == 1) { %>
					<h4 style="color:#FF4500">Preparando </h4>
				<% } else if(Integer.parseInt(pedido.getEstado()) == 2) { %>
					<h4 style="color:#00008B">Listo para recoger </h4>
				<% } else if(Integer.parseInt(pedido.getEstado()) == 3) { %>
					<h4 style="color: #006400">Entregado </h4>
			<% } else if(Integer.parseInt(pedido.getEstado()) == 4) { %>
				<h4 style="color: #FF0000">Cancelado </h4>
				<% } %>


			
            <table class="tablaPedidos">
                <thead>
                    <tr>
                        <td>Producto</td>
                        <td>Precio / u</td>
                        <td>Cantidad</td>
						<td>Precio</td>
                    </tr>
                </thead>
                <tbody>
                    <% for (ArrayList<String> detalle : detalles) { %>
                        <tr>
                            <td><%= detalle.get(0) %></td>
                            <td><%= String.valueOf(detalle.get(1)) + "&euro;" %></td>
                            <td><%= detalle.get(2) %></td>
							<td><%= String.valueOf( Float.parseFloat(detalle.get(1)) * Integer.parseInt(detalle.get(2))) + "&euro;" %></td>
                        </tr>
                    <% } %>
					<tfoot>
						<tr>
							<td>Precio total</td><td></td><td></td>
							<td> <%= precioTotal +"&euro;" %></td>
						</tr>
					</tfoot>
                </tbody>
            </table>

			<% if(pedido.getEstado() == null || Integer.parseInt(pedido.getEstado()) == 0) { %>
				<form method="post" action="CancelarPedido.html" style="display: flex; flex-direction: column;">
					<input type="hidden" name="codigoPedido" value="<%= codigoPedido %>">
					<input type="submit" class="cancelarPedido" value="Cancelar pedido">
				</form>
			<% }else if(Integer.parseInt(pedido.getEstado()) == 4){
				%>
				<form method="post" action="EliminarPedido.html" style="display: flex; flex-direction: column;">
					<input type="hidden" name="codigoPedido" value="<%= codigoPedido %>">
					<input type="submit" class="cancelarPedido" value="Eliminar">
				</form>
			<% } %>
        </div>

        <% 
                    }
                }
            } else {
        %>

        <h3 style="margin-left:35%;">Todav&iacute;a no hay pedidos</h3>

        <% } %>

    </div>
    

	<div class="container formulario-oculto formularioUsuario">
		<form method="post" action="usuarioContrasena.html">
			<div class="form-group mt-3">
				<div class="row">
					<div class="col">
						<label>Modificar Contrase&ntilde;a: </label>
						<input type="password" class="form-control bg-light mb-2 mt-2" name="nuevaContrasena" placeholder="Nueva">
						<input type="password" class="form-control bg-light mb-2 mt-2" name="nueva2" placeholder="Repite la nueva contrase&ntilde;a">
					</div>
					<div class="col mt-2">
						<br>
						<input type="password" class="form-control bg-light mb-2 mt-2" name="antigua1" placeholder="Contrase&ntilde;a antigua">
						<div class="col text-right">
							<input type="submit" class="btn btn-primary mb-2 mt-2" value="Cambiar Contrase&ntilde;a">
						</div>
					</div>	
				</div>
				
				
			</div>
			<% if(cambioContrasena != null) { %>
			<h4><%= cambioContrasena %></h4>
			<% } %>
		</form>
	</div>
	<div class="container formulario-oculto formularioUsuario">
		<form method="post" action="usuarioNombre.html">
			<div class="form-group mt-3">
				<label>Modificar nombre: </label>
				<input type="text" class="form-control bg-light mb-2 mt-2" name="nuevoNombre">
				<div class="col text-right">
					<input type="submit" class="btn btn-primary mb-2 mt-2" value="Cambiar nombre" onclick="alert('Nombre actualizado')">
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="container formulario-oculto formularioUsuario">
		<form method="post" action="usuarioDireccion.html">
			<div class="form-group mt-3">
				<label>Modificar direcci&oacute;n: </label>
				<input type="text" class="form-control bg-light mb-2 mt-2" name="nuevaDir">
				<div class="col text-right">
					<input type="submit" class="btn btn-primary mb-2 mt-2" value="Cambiar Direcci&oacute;n" onclick="alert('Dirección actualizada')">
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="container formulario-oculto formularioUsuario">
		<form method="post" action="usuarioTlf.html">
			<div class="form-group mt-3">
				<label>Modificar tel&eacute;fono: </label>
				<input type="text" class="form-control bg-light mb-2 mt-2" name="nuevoTlf">
				<div class="col text-right">
					<input type="submit" class="btn btn-primary mb-2 mt-2" value="Cambiar Tel&eacute;fono" onclick="alert('Teléfono actualizado')">
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="container formulario-oculto formularioUsuario">
		<form method="post" action="usuarioCorreo.html">
			<div class="form-group mt-3">
				<label>Modificar Correo electr&oacute;nico: </label>
				<input type="text" class="form-control bg-light mb-2 mt-2" name="nuevoCorreo">
				<div class="col text-right">
					<input type="submit" class="btn btn-primary mb-2 mt-2" onclick="alert('Correo actualizado')" value="Cambiar Correo electr&oacute;nico">
				</div>
			</div>
		</form>
	</div>

	<div class="mt-5 p-1 bg-dark text-white  cuerpo">
		<mi-pie></mi-pie>
	</div>

	<script>
		console.log(window.location.href);
		if(window.location.href.indexOf('detallesPedido.html') === -1)  window.location.href = './detallesPedido.html';
	</script>

	<script src="./js/usuarioFormularios.js"></script>
	<script src="./js/mis-etiquietas.js"></script>
</body>
</html>