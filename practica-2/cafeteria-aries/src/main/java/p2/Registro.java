package p2;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class Registro
 */
//@WebServlet("/registro.html")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registro() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		RequestDispatcher rd = request.getRequestDispatcher("registro.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//HttpSession sesion = request.getSession();
		AccesoBD acceso = AccesoBD.getInstance();
		
		String usuario = request.getParameter("usuario");
		String clave = request.getParameter("contrasena");
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("correo");
		String telefono = request.getParameter("telefono");
		String direccion = request.getParameter("direccion");
		
		
		
		
		
		if(usuario != "" && clave!= "")
		{
			acceso.registrarUsuario(usuario, clave, nombre, email, telefono, direccion);

			int res = acceso.comprobarUsuarioBD(usuario, clave);
			HttpSession sesion = request.getSession(true);

			sesion.setAttribute("usuarioCodigo", res);

			RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
			rd.forward(request, response);
		}
		else{
			String msg = "Alguno de los campos está vacío, por favor, rellénelos todos";
			request.setAttribute("msg", msg);
		}
		
		//int codigo = acceso.comprobarUsuarioBD(usuario, clave);
		
		//if(codigo > 0) sesion.setAttribute("usuario", codigo);
		
		//sesion.invalidate();
		
	}

}
