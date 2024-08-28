package p2;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class CambioContrasena
 */

public class CambioContrasena extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambioContrasena() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession();
		AccesoBD acceso = AccesoBD.getInstance();
		
		String nueva = request.getParameter("nuevaContrasena");
		String antigua1 = request.getParameter("antigua1");
		String nueva2 = request.getParameter("nueva2");
		int codigo = (Integer)sesion.getAttribute("usuarioCodigo");
		
		//if(clave.equals(usuario.getClave()))
		boolean exito = acceso.modificarContrasena(nueva, nueva2, antigua1, codigo);
		if(exito) request.setAttribute("cambio", "Se ha cambiado la contraseña con éxito");
		else request.setAttribute("cambio", "Ha habido un error al cambiar la contraseña");
		
		RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
		rd.forward(request, response);
	}

}
