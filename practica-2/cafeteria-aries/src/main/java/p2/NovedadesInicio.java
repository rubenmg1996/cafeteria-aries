package p2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
 /* Servlet implementation class NovedadesInicio
 */

public class NovedadesInicio extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovedadesInicio() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccesoBD bbdd = AccesoBD.getInstance();
        List<ProductoBD> productos = bbdd.obtenerProductosBD();
        
        List<ProductoBD> productosN = new ArrayList<>();
        for(int i = 0; i<productos.size(); i++) {
        	if(productos.get(i).getNovedad()) productosN.add(productos.get(i));
        }
        request.setAttribute("productos-nuevos", productosN);


        RequestDispatcher rd = request.getRequestDispatcher("inicio.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccesoBD bbdd = AccesoBD.getInstance();
        List<ProductoBD> productosN = bbdd.obtenerProductosBD();
        request.setAttribute("productos-nuevos", productosN);

        RequestDispatcher rd = request.getRequestDispatcher("inicio.jsp");
        rd.forward(request, response);
    }
}