<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Productos</title>
</head>
<body>
<p>HOLA....</p>
<div class = "container">
<div class = "row">
<%


	AccesoBD bbdd = AccesoBD.getInstance();
	List<ProductoBD> productos = (List<ProductoBD>)request.getAttribute("listado-productos");
    %> 
    <h5><%= productos.size();%></h5>
    <%

	
	for(int i = 0; productos != null && i < productos.size(); i++){
		
			ProductoBD prod = productos.get(i);
			String idNum = "prod" + i;
			
%>

<div class="col-sm-4">
  <div class="elementoMenu">
    <%= prod.getDescripcion()%>
    <br>

    <img class="imgMenu" src=<%= "media/" + prod.getImagen() %> width="200" height="200">
    <br>

    <% if(prod.getStock() > 0) { %>
      <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " €" %> </label>
      <div class="row">
        <div class="col-md-6 col-sm-12">
          <input type="number" value="1" class="form-control" id="<%=idNum %>" min="0" max="<%= prod.getStock() %>">
        </div>
        <div class="col-md-6 col-sm-12">
          <!--<input type="button" class="btn bg-primary" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%=idNum %>').value, <%=prod.getPrecio() %>); alert('Producto añadido con éxito');"> -->
        </div>
      </div>
    <% } else { %>
      <label>Lo sentimos, no quedan <%=prod.getDescripcion() %></label>
    <% } %>
  </div>
</div>
<%
		}
	
%>
</div>
</div>



</body>
</html>