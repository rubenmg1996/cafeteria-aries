package p2;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;


public class MisPedidos extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MisPedidos() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(true);

        if(sesion !=null && sesion.getAttribute("usuarioCodigo") != null) {//Si ya he hecho login
			AccesoBD acceso = AccesoBD.getInstance();
            int codUsu = (int) sesion.getAttribute("usuarioCodigo");

            try {
                int[] codigosPedidos = acceso.buscaPedidoUsu(codUsu);
                
                if (codigosPedidos != null)
                {
                    List<ProductoBD> productos = acceso.obtenerProductosBD();
                    HashMap<Integer, ArrayList<ArrayList<String>>> detallesPorPedido = new HashMap<>();
                    for (int i = 0; i < codigosPedidos.length; i++) {
                        List<DetallesPedido> dp = acceso.verDetalles(codigosPedidos[i]);
                        ArrayList<ArrayList<String>> detallesPedido = new ArrayList<>();
        
                        for (DetallesPedido detalle : dp) {
        
                            for (ProductoBD producto : productos) {
                                if (detalle.getCodProd() == producto.getCodigo()) {
                                    ArrayList<String> detallesProd = new ArrayList<>();
                                    detallesProd.add(producto.getDescripcion());
                                    detallesProd.add(Float.toString(producto.getPrecio()));
                                    detallesProd.add(Integer.toString(detalle.getCantidad()));
                                    detallesPedido.add(detallesProd);
                                    
                                    break;
                                }
                            }
        
                        }
        
                        detallesPorPedido.put(codigosPedidos[i], detallesPedido);
                    }
        
                    request.setAttribute("detallesPorPedido", detallesPorPedido);
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
            }

            RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
            
            rd.forward(request, response);
			
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}

        

        }
    }
