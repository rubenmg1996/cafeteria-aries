package p2;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class CambioCorreo
 */
public class CancelarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelarPedido() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

AccesoBD acceso = AccesoBD.getInstance();

//String clave = request.getParameter("contrasenaCorreo");
int codigo = Integer.parseInt(request.getParameter("codigoPedido"));

//UsuarioBD usuario = acceso.VerUsuarios(codigo);
try {
    
    //if(clave.equals(usuario.getClave()))
        acceso.cancelarPedido(codigo);
} catch (SQLException e) {

    e.printStackTrace();
}
		
		RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
		rd.forward(request, response);
	}
	}



