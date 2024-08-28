package p2;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
/**
 * Servlet implementation class Usuario
 */
//@WebServlet("/usuario.html")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Usuario() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession sesion = request.getSession(false);
		
		if(sesion !=null && sesion.getAttribute("usuarioCodigo") != null) {//Si ya he hecho login
			
			sesion.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			
		}

			
		
	}

}
