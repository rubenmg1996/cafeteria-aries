package p2;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession(true);
		
		if(sesion !=null && sesion.getAttribute("usuarioCodigo") != null) {//Si ya he hecho login
			RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
			rd.forward(request, response);
			
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user = request.getParameter("user");
		String clave = request.getParameter("clave");
		String url = request.getParameter("url");
		
		AccesoBD acceso = AccesoBD.getInstance();
		
		int res = acceso.comprobarUsuarioBD(user, clave);
		HttpSession sesion = request.getSession(true);
		
		if(res == -1) {
			
			
			request.setAttribute("MSG-ERROR", "Usuario y/o contrasena incorrectos");
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}else {
			sesion.setAttribute("usuarioCodigo", res);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request,response);
		}
		
		
	}

}
