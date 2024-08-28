<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles de Pedidos</title>
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
    <h3>Pedidos</h3>

    <div class="ticket-container">
        <% 
            HashMap<Integer, ArrayList<ArrayList<String>>> detallesPorPedido = (HashMap<Integer, ArrayList<ArrayList<String>>>) request.getAttribute("detallesPorPedido");

            if (detallesPorPedido != null && !detallesPorPedido.isEmpty()) {
                for (int codigoPedido : detallesPorPedido.keySet()) {
                    ArrayList<ArrayList<String>> detalles = detallesPorPedido.get(codigoPedido);
                    String precioTotal = calcularPrecioTotal(detalles);

                    PedidoBD pedido = acceso.VerPedido(codigoPedido);
                    
                    if (!detalles.isEmpty()) { // Evitar tickets vacíos
        %>

        <div class="ticket">
            <h4>Ticket Pedido: <%= codigoPedido %></h4>

            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (ArrayList<String> detalle : detalles) { %>
                        <tr>
                            <td><%= detalle.get(0) %></td>
                            <td><%= detalle.get(1) %></td>
                            <td><%= detalle.get(2) %></td>
                        </tr>
                    <% } %>
                    <tr class="total">
                        <td colspan="3">Precio Total: <%= precioTotal %></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <% 
                    }
                }
            } else {
        %>

        <h3>Todav&iacute;a no hay pedidos</h3>

        <% } %>

    </div>

    <%!
    private String calcularPrecioTotal(ArrayList<ArrayList<String>> detalles) {
        float total = 0;
        for (ArrayList<String> detalle : detalles) {
            float precio = Float.parseFloat(detalle.get(1));
            int cantidad = Integer.parseInt(detalle.get(2));
            total += precio * cantidad;
        }
        return String.format("%.2f", total);
    }
    %>

    <div class="mt-5 p-1 bg-dark text-white  cuerpo">
        <mi-pie></mi-pie>
    </div>

    <script src="./js/mis-etiquietas.js"></script>
</body>
</html>