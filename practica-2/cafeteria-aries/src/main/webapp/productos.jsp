<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
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
  <script src="./js/carrito.js"></script>
  

<nav class="navbar navbar-expand-lg menuProductos">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span>
        <img src="media/colapso.png" alt="menu" width="30" height="30">
      </span>
    </button>
    <div class="collapse navbar-collapse" id="navbarMenu">
      <ul class="navbar-nav col-md-12 menuProd">
        <div class="col-12 col-lg-4">
          <div class="row">
            <li class="nav-item col-12 col-lg-4">
              <a class="nav-link text-dark d-flex justify-content-center"  href="#" id="botonNovedades" name="novedades" onclick="mostrar($novedades)">Novedades</a>
            </li>
            <li class="nav-item col-12 col-lg-4">
              <a class="nav-link text-dark d-flex justify-content-center"  href="#" id="botonBebida" name="bebida" onclick="mostrar($bebidas)">Bebidas</a>
            </li>
            <li class="nav-item col-12 col-lg-4">
              <a class="nav-link text-dark d-flex justify-content-center"  href="#" id="botonAperitivo" name="aperitivo" onclick="mostrar($aperitivos)">Aperitivos</a>
            </li>
          </div>
        </div>
        <div class="col-12 col-lg-4">
          <div class="row">
            <li class="nav-item col-12 col-lg-4">
              <a class="nav-link text-dark d-flex justify-content-center"  href="#" name="botonPlato" onclick="mostrar($platos)">Platos combinados</a>
            </li>
            <li class="nav-item col-12 col-lg-4">
              <a class="nav-link text-dark d-flex justify-content-center" href="#" id="botonBocadillo" name="bocadillo" onclick="mostrar($bocadillos)">Bocadillos</a>
            </li>
            <li class="nav-item col-12 col-lg-4">
              <a class="nav-link text-dark d-flex justify-content-center"  href="#" id="botonEnsalada" name="ensalada" onclick="mostrar($ensaladas)">Ensaladas</a>
            </li>
          </div>
        </div>
       <div class="col-12 col-lg-4">
        <div class="row">
          <li class="nav-item col-12 col-lg-4">
            <a class="nav-link text-dark d-flex justify-content-center"  href="#" id="botonHamburguesa" name="burguer" onclick="mostrar($hamburguesas)">Hamburguesas</a>
          </li>
          <li class="nav-item col-12 col-lg-4">
            <a class="nav-link text-dark d-flex justify-content-center" href="#" id="botonPizza" name="pizza" onclick="mostrar($pizzas)">Pizzas</a>
          </li>
          <li class="nav-item col-12 col-lg-4">
            <a class="nav-link text-dark d-flex justify-content-center"  href="#" id="botonPostre" name="postre" onclick="mostrar($postres)">Postres</a>
          </li>
        </div>
       </div>
        
      </ul>
    </div>
  </div>
</nav>

<div id="novedades" class = "container-fluid">
  <div class="row m-2">
<% 	AccesoBD con=AccesoBD.getInstance();
    List<ProductoBD> productosNuevos = (List<ProductoBD>)request.getAttribute("listado-productos-nuevos");

    for(int i = 0; productosNuevos != null && i < productosNuevos.size(); i++){
        ProductoBD prod = productosNuevos.get(i);
        String idNum = "prod" + i;

        %>   
            <div class="col-lg-3 mt-2 mb-2 col-md-6">
          <div class="elementoMenu">

            <p><%= prod.getDescripcion()%></p>
            
            <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
            <br>
            <% if(prod.getStock() > 0) { %>
              <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <input type="number" value="1" class="inputNumMenu" id="<%="novedad"+idNum %>" min="0" max="<%= prod.getStock() %>">
                </div>
                <div class="col-md-6 col-sm-12">
                  <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="novedad"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

<div id="bebidas" class = "container-fluid">
  <div class="row m-2">
<% 	
    List<ProductoBD> productosBebida = (List<ProductoBD>)request.getAttribute("listado-productos-bebida");

    for(int i = 0; productosBebida != null && i < productosBebida.size(); i++){
        ProductoBD prod = productosBebida.get(i);
        String idNum = "prod" + i;

        %>
        
          
        <div class="col-lg-3 mt-2 mb-2 col-md-6">
          <div class="elementoMenu">
            <p><%= prod.getDescripcion()%></p>


            <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
            <br>
            <% if(prod.getStock() > 0) { %>
              <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <input type="number" value="1" class="inputNumMenu" id="<%="bebida"+idNum %>" min="0" max="<%= prod.getStock() %>">
                </div>
                <div class="col-md-6 col-sm-12">
                  <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="bebida"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>);">
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

    <div id="aperitivo" class = "container-fluid">
      <div class="row m-2">
    <% 	
        List<ProductoBD> productosAperitivo = (List<ProductoBD>)request.getAttribute("listado-productos-aperitivo");
    
        for(int i = 0; productosAperitivo != null && i < productosAperitivo.size(); i++){
            ProductoBD prod = productosAperitivo.get(i);
            String idNum = "prod" + i;
    
            %>
            
              
            <div class="col-lg-3 mt-2 mb-2 col-md-6">
              <div class="elementoMenu">
                <p><%= prod.getDescripcion()%></p>
    
                <% 
                if(prod.getNovedad()) {
              %>
                <!-- Novedad -->
              <%
                }
              %>
    
                <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                <br>
                <% if(prod.getStock() > 0) { %>
                  <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                  <div class="row">
                    <div class="col-md-6 col-sm-12">
                      <input type="number" class="inputNumMenu" value="1"  id="<%="aperitivo"+idNum %>" min="0" max="<%= prod.getStock() %>">
                    </div>
                    <div class="col-md-6 col-sm-12">
                      <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="aperitivo"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

        <div id="plato" class = "container-fluid">
          <div class="row m-2">
        <% 	
            List<ProductoBD> productosPlato = (List<ProductoBD>)request.getAttribute("listado-productos-plato");
        
            for(int i = 0; productosPlato != null && i < productosPlato.size(); i++){
                ProductoBD prod = productosPlato.get(i);
                String idNum = "prod" + i;
        
                %>
                
                  
                <div class="col-lg-3 mt-2 mb-2 col-md-6">
                  <div class="elementoMenu">
                    <p><%= prod.getDescripcion()%></p>
        
                    <% 
                    if(prod.getNovedad()) {
                  %>
                    <!-- Novedad -->
                  <%
                    }
                  %>
        
                    <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                    <br>
                    <% if(prod.getStock() > 0) { %>
                      <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <input type="number" value="1" class="inputNumMenu" id="<%="plato"+idNum %>" min="0" max="<%= prod.getStock() %>">
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="plato"+idNum %>').value, <%=prod.getPrecio() %>), <%= prod.getStock()%>; ">
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

            <div id="bocadillos" class = "container-fluid">
              <div class="row m-2">
            <% 	
                List<ProductoBD> productosBocadillo = (List<ProductoBD>)request.getAttribute("listado-productos-bocadillo");
            
                for(int i = 0; productosBocadillo != null && i < productosBocadillo.size(); i++){
                    ProductoBD prod = productosBocadillo.get(i);
                    String idNum = "prod" + i;
            
                    %>
                    
                      
                    <div class="col-lg-3 mt-2 mb-2 col-md-6">
                      <div class="elementoMenu">
                        <p><%= prod.getDescripcion()%></p>
            
                        <% 
                        if(prod.getNovedad()) {
                      %>
                        <!-- Novedad -->
                      <%
                        }
                      %>
            
                        <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                        <br>
                        <% if(prod.getStock() > 0) { %>
                          <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <input type="number" value="1" class="inputNumMenu" id="<%="bocadillo"+idNum %>" min="0" max="<%= prod.getStock() %>">
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="bocadillo"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

                <div id="hamburguesas" class = "container-fluid">
                  <div class="row m-2">
                <% 	
                    List<ProductoBD> productosHamburguesa = (List<ProductoBD>)request.getAttribute("listado-productos-hamburguesa");
                
                    for(int i = 0; productosHamburguesa != null && i < productosHamburguesa.size(); i++){
                        ProductoBD prod = productosHamburguesa.get(i);
                        String idNum = "prod" + i;
                
                        %>
                        
                          
                        <div class="col-lg-3 mt-2 mb-2 col-md-6">
                          <div class="elementoMenu">
                            <p><%= prod.getDescripcion()%></p>
                
                            <% 
                            if(prod.getNovedad()) {
                          %>
                            <!-- Novedad -->
                          <%
                            }
                          %>
                
                            <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                            <br>
                            <% if(prod.getStock() > 0) { %>
                              <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                              <div class="row">
                                <div class="col-md-6 col-sm-12">
                                  <input type="number" value="1" class="inputNumMenu" id="<%="hamburguesa"+idNum %>" min="0" max="<%= prod.getStock() %>">
                                </div>
                                <div class="col-md-6 col-sm-12">
                                  <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="hamburguesa"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

                    <div id="ensaladas" class = "container-fluid">
                      <div class="row m-2">
                    <% 	
                        List<ProductoBD> productosEnsalada = (List<ProductoBD>)request.getAttribute("listado-productos-ensalada");
                    
                        for(int i = 0; productosEnsalada != null && i < productosEnsalada.size(); i++){
                            ProductoBD prod = productosEnsalada.get(i);
                            String idNum = "prod" + i;
                    
                            %>
                            
                              
                            <div class="col-lg-3 mt-2 mb-2 col-md-6">
                              <div class="elementoMenu">
                                <p><%= prod.getDescripcion()%></p>
                    
                                <% 
                                if(prod.getNovedad()) {
                              %>
                                <!-- Novedad -->
                              <%
                                }
                              %>
                    
                                <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                                <br>
                                <% if(prod.getStock() > 0) { %>
                                  <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                                  <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                      <input type="number" value="1" class="inputNumMenu" id="<%="ensalada"+idNum %>" min="0" max="<%= prod.getStock() %>">
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                      <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="ensalada"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

                        <div id="pizzas" class = "container-fluid">
                          <div class="row m-2">
                        <% 	
                            List<ProductoBD> productosPizza = (List<ProductoBD>)request.getAttribute("listado-productos-pizza");
                        
                            for(int i = 0; productosPizza != null && i < productosPizza.size(); i++){
                                ProductoBD prod = productosPizza.get(i);
                                String idNum = "prod" + i;
                        
                                %>
                                
                                  
                                <div class="col-lg-3 mt-2 mb-2 col-md-6">
                                  <div class="elementoMenu">
                                    <p><%= prod.getDescripcion()%></p>
                        
                                    <% 
                                    if(prod.getNovedad()) {
                                  %>
                                    <!-- Novedad -->
                                  <%
                                    }
                                  %>
                        
                                    <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                                    <br>
                                    <% if(prod.getStock() > 0) { %>
                                      <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                                      <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                          <input type="number" value="1" class="inputNumMenu" id="<%="pizza"+idNum %>" min="0" max="<%= prod.getStock() %>">
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                          <%
                                          %>
                                          <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="pizza"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

                            <div id="postres" class = "container-fluid">
                              <div class="row m-2">
                            <% 	
                                List<ProductoBD> productosPostre = (List<ProductoBD>)request.getAttribute("listado-productos-postre");
                            
                                for(int i = 0; productosPostre != null && i < productosPostre.size(); i++){
                                    ProductoBD prod = productosPostre.get(i);
                                    String idNum = "prod" + i;
                            
                                    %>
                                    
                                      
                                    <div class="col-lg-3 mt-2 mb-2 col-md-6">
                                      <div class="elementoMenu">
                                        <p><%= prod.getDescripcion()%></p>
                            
                                        <% 
                                        if(prod.getNovedad()) {
                                      %>
                                        <!-- Novedad -->
                                      <%
                                        }
                                      %>
                            
                                        <img class="imgMenu" alt=<%=prod.getDescripcion()%> src=<%= "media/" + prod.getImagen() %> >
                                        <br>
                                        <% if(prod.getStock() > 0) { %>
                                          <label>A&ntilde;adir producto(s): <%= prod.getPrecio() + " &euro;" %> </label>
                                          <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                              <input type="number" value="1" class="inputNumMenu" id="<%="postre"+idNum %>" min="0" max="<%= prod.getStock() %>">
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                              <input type="button" class="botonElemMenu" value="A&ntilde;adir" onclick="anyadirProd(<%=prod.getCodigo()%> ,'<%= prod.getDescripcion() %>', document.getElementById('<%="postre"+idNum %>').value, <%=prod.getPrecio() %>, <%= prod.getStock()%>); ">
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

                                <div class="mt-5 p-1 bg-dark text-white  cuerpo">
                                  <mi-pie></mi-pie>
                                </div>
                            
                                <script src="./js/mis-etiquietas.js"></script>
                                <script src= "./js/mostrarproductos.js"></script>

                                <script>
                                  $(document).ready(function() {
                                    $('.navbar-nav li a').click(function() {
                                      if ($('.navbar-toggler').is(':visible')) {
                                        $('.navbar-collapse').collapse('hide');
                                      }
                                    });
                                  })
                                </script>
                                

</body>
</html>