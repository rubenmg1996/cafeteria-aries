package p2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class ListadoProductos
 */

public class ListadoProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListadoProductos() {
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

		List<ProductoBD> productosBebida = bbdd.obtenerProductosBDPorTipo("bebida");
		List<ProductoBD> productosAperitivo = bbdd.obtenerProductosBDPorTipo("aperitivo");
		List<ProductoBD> productosPlato = bbdd.obtenerProductosBDPorTipo("plato");
		List<ProductoBD> productosBocadillo = bbdd.obtenerProductosBDPorTipo("bocadillo");
		List<ProductoBD> productosHamburguesa = bbdd.obtenerProductosBDPorTipo("hamburguesa");
		List<ProductoBD> productosEnsalada = bbdd.obtenerProductosBDPorTipo("ensalada");
		List<ProductoBD> productosPizza = bbdd.obtenerProductosBDPorTipo("pizza");
		List<ProductoBD> productosPostre = bbdd.obtenerProductosBDPorTipo("postre");
	
		request.setAttribute("listado-productos-todos", productos);
		request.setAttribute("listado-productos-bebida", productosBebida);
		request.setAttribute("listado-productos-nuevos", productosN);
		request.setAttribute("listado-productos-aperitivo", productosAperitivo);
		request.setAttribute("listado-productos-plato", productosPlato);
		request.setAttribute("listado-productos-bocadillo", productosBocadillo);
		request.setAttribute("listado-productos-hamburguesa", productosHamburguesa);
		request.setAttribute("listado-productos-ensalada", productosEnsalada);
		request.setAttribute("listado-productos-pizza", productosPizza);
		request.setAttribute("listado-productos-postre", productosPostre);
		
		RequestDispatcher rd = request.getRequestDispatcher("productos.jsp");
		rd.forward(request, response);

		
	}
	
	


}
