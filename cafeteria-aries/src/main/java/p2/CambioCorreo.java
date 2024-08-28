package p2;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class CambioCorreo
 */
public class CambioCorreo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambioCorreo() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession();
		AccesoBD acceso = AccesoBD.getInstance();
		
		//String clave = request.getParameter("contrasenaCorreo");
		String correo = request.getParameter("nuevoCorreo");
		int codigo = (Integer)sesion.getAttribute("usuarioCodigo");
		
		//UsuarioBD usuario = acceso.VerUsuarios(codigo);
		try {
			
			//if(clave.equals(usuario.getClave()))
				acceso.modificarUsuario("email", correo, codigo);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
		rd.forward(request, response);
	}
	}


