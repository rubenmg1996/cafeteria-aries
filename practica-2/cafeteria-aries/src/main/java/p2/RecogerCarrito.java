package p2;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.json.*;
/**
 * Servlet implementation class RecogerCarrito
 */
//@WebServlet("/RecogerCarrito")
public class RecogerCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecogerCarrito() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    
		HttpSession sesion = request.getSession(true);

		if(sesion !=null && sesion.getAttribute("usuarioCodigo") != null) {

		request.setAttribute("usuariocarrito", sesion.getAttribute("usuarioCodigo"));
		
		RequestDispatcher rd = request.getRequestDispatcher("carrito.jsp");
		rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("loginCarrito.jsp");
			rd.forward(request, response);
		}
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList <ProductoCarrito> carritoJSON = new ArrayList<ProductoCarrito>();
		JsonReader jsonReader = Json.createReader(
		new InputStreamReader(request.getInputStream()));
		JsonArray jobj = jsonReader.readArray();
		
		AccesoBD acceso = AccesoBD.getInstance();
		HttpSession sesion = request.getSession(true);
		
		
		if(sesion !=null && sesion.getAttribute("usuarioCodigo") != null) {//Si ya he hecho login
			
			
		
		for (int i = 0; i < jobj.size(); i++) {
			JsonObject prod = jobj.getJsonObject(i);
			ProductoCarrito nuevo = new ProductoCarrito();
			nuevo.setCodigo(prod.getInt("codigo"));
			nuevo.setNombre(prod.getString("nombre"));
			nuevo.setPrecio(Float.parseFloat(prod.get("precio").toString()));
			nuevo.setCantidad(prod.getInt("cantidad"));
			carritoJSON.add(nuevo);
			
			
			
		}
		RequestDispatcher rd = request.getRequestDispatcher("carrito.jsp");
		rd.forward(request, response);
		
		List<ProductoBD> aux = new ArrayList<ProductoBD>();
		aux = acceso.obtenerProductosBD();
		String mensaje = "";
		for(int i=0; i < carritoJSON.size(); i++)
		{
			int codigo = carritoJSON.get(i).getCodigo();
			ProductoBD producto = new ProductoBD();
			for(int j = 0; j < aux.size(); j++)
			{
				if(aux.get(j).getCodigo() == codigo) producto = aux.get(j);
			}
			int existencias = producto.getStock();
			
			if(existencias < carritoJSON.get(i).getCantidad()) carritoJSON.get(i).cantidad = existencias;
			mensaje = "Lo sentimos, no tenemos suficientes existencias de " + carritoJSON.get(i).getNombre() + ". Se ha actualizado la cantidad en el carrito \n";
			request.setAttribute("existenciasActualizadas", mensaje);
			
			
			
		}
		
		int codigoPedido = acceso.registrarPedido((Integer)sesion.getAttribute("usuarioCodigo"), carritoJSON);
		
		for(int i=0; i < carritoJSON.size(); i++)
		{
			int codigo = carritoJSON.get(i).getCodigo();
			int cantidad = carritoJSON.get(i).getCantidad();
			ProductoBD producto = null;
			for(int j = 0; j < aux.size(); j++)
			{
				if(aux.get(j).getCodigo() == codigo) {
					producto = aux.get(j);
					break;
				}
			}
			if (producto != null) {
				try {
					acceso.anyadeProdPedido(producto, codigoPedido, cantidad);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}			
		}

	}else {
		
		RequestDispatcher rd = request.getRequestDispatcher("carrito.jsp");
		rd.forward(request, response);
		request.setAttribute("usuariocarrito", null);
	}
	} 
		
	

}
