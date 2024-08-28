package p2;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class ListadoProductos
 */

public class ObtenerProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerProductos() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AccesoBD bbdd = AccesoBD.getInstance();
        List<ProductoBD> productos = bbdd.obtenerProductosBD();
			
		request.setAttribute("listado-producto", productos);
		
		RequestDispatcher rd = request.getRequestDispatcher("productos.jsp");
		rd.forward(request, response);

		
	}
	
	


}
