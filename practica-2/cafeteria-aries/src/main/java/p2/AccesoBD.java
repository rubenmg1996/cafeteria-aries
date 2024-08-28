package p2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

//#region accesoBD
public final class AccesoBD {
	private static AccesoBD instanciaUnica = null;
	private Connection conexionBD = null;

	public static AccesoBD getInstance() {
		if (instanciaUnica == null) {
			instanciaUnica = new AccesoBD();
		}
		return instanciaUnica;
	}
	private AccesoBD() {
		abrirConexionBD();
	}
	public void abrirConexionBD() {
		if (conexionBD == null)
		{
			String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
			// daw es el nombre de la base de datos que hemos creado con anterioridad.
			String DB_URL = "jdbc:mariadb://localhost:3306/bbddbar";
			// El usuario root y su clave son los que se puso al instalar MariaDB.
			String USER = "root";
			String PASS = "DawLab";
			try {
				Class.forName(JDBC_DRIVER);
				conexionBD = DriverManager.getConnection(DB_URL,USER,PASS);
			}
			catch(Exception e) {
				System.err.println("No se ha podido conectar a la base de datos");
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}
	public void cerrarConexionBD() {
		if (conexionBD != null) {
			try {
				conexionBD.close();
				conexionBD = null;
			}
			catch(Exception e) {
				System.err.println("No se ha podido desconectar de la base de datos");
				System.err.println(e.getMessage());
			}
		}
	}
	public boolean comprobarAcceso() {
		abrirConexionBD();
		boolean res = (conexionBD != null);
		cerrarConexionBD();
		return res;
	}

	 //#endregion

	 //#region Productos
	
	public List<ProductoBD> obtenerProductosBD()
	{
		List<ProductoBD> productos = new ArrayList<ProductoBD>();
		
		abrirConexionBD();
		
		try {
				// hay que tener en cuenta las columnas de vuestra tabla de productos
				// también se puede utilizar una consulta del tipo:
				// con = "SELECT * FROM productos";
				String con = "SELECT codigo,descripcion,precio,existencias,imagen,tipo,ingredientes,novedad FROM productos";
				Statement s = conexionBD.createStatement();
				ResultSet resultado = s.executeQuery(con);
				
				while(resultado.next()){
					ProductoBD producto = new ProductoBD();
					producto.setCodigo(resultado.getInt("codigo"));
					producto.setDescripcion(resultado.getString("descripcion"));
					producto.setPrecio(resultado.getFloat("precio"));
					producto.setStock(resultado.getInt("existencias"));
					producto.setImagen(resultado.getString("imagen"));
					producto.setTipo(resultado.getString("tipo"));
					producto.setIngredientes(resultado.getString("ingredientes"));
					producto.setNovedad(resultado.getBoolean("novedad"));
					productos.add(producto);
			}
		}
		catch(Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
		}
		return productos;
	}
	
	public List<ProductoBD> obtenerProductosBDPorTipo(String tipo)
	{
		List<ProductoBD> productos = new ArrayList<ProductoBD>();
		
		abrirConexionBD();
		
		try {
				// hay que tener en cuenta las columnas de vuestra tabla de productos
				// también se puede utilizar una consulta del tipo:
				// con = "SELECT * FROM productos";
				ResultSet resultado;
				if(tipo.equals("novedades") )
				{
					String con = "SELECT codigo,descripcion,precio,existencias,imagen,tipo,ingredientes,novedad FROM productos WHERE novedad = true ";
					Statement s = conexionBD.createStatement();
					resultado = s.executeQuery(con);
				}
				else {
					String con = "SELECT codigo,descripcion,precio,existencias,imagen,tipo,ingredientes,novedad FROM productos WHERE tipo=? ";
					PreparedStatement s = conexionBD.prepareStatement(con);
					s.setString(1, tipo);
					resultado = s.executeQuery();
				}
			
				while(resultado.next()){
					ProductoBD producto = new ProductoBD();
					producto.setCodigo(resultado.getInt("codigo"));
					producto.setDescripcion(resultado.getString("descripcion"));
					producto.setPrecio(resultado.getFloat("precio"));
					producto.setStock(resultado.getInt("existencias"));
					producto.setImagen(resultado.getString("imagen"));
					producto.setTipo(resultado.getString("tipo"));
					producto.setIngredientes(resultado.getString("ingredientes"));
					producto.setNovedad(resultado.getBoolean("novedad"));
					productos.add(producto);
			}
		}
		catch(Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}

		return productos;
	}
	

	//#endregion
	//#region Usuarios

	public int comprobarUsuarioBD(String usuario, String clave) {
		abrirConexionBD();
		try{
			String con = "SELECT codigo FROM usuarios WHERE usuario=? AND clave=md5(?)";
			
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1,usuario);
			s.setString(2,clave);
			ResultSet resultado = s.executeQuery();
			
			if ( resultado.next() ) { // El usuario/clave se encuentra en la BD
				return resultado.getInt("codigo");
			}
		}
		catch(Exception e) { // Error en la conexión con la BD
			e.printStackTrace();
		}
		cerrarConexionBD();
		return -1;
		}
	
	public boolean registrarUsuario(String usuario, String clave, String nombre, String email, String tlf, String dir) {
		
		abrirConexionBD();
		boolean creado = false;
		try{
			
			String con = "INSERT INTO usuarios (codigo, activo, admin, usuario, clave, nombre, direccion, telefono, email) VALUES (NULL, null, 0, ?,md5(?),?,?,?,?);";
			
			
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, usuario);
			s.setString(2, clave);
			s.setString(3, nombre);
			s.setString(4, dir);
			s.setString(5, tlf);
			s.setString(6, email);
			//ResultSet resultado = s.executeQuery();
			s.execute();
			creado = s.getLargeUpdateCount()>0;
		}
		catch(Exception e) { // Error en la conexión con la BD
			e.printStackTrace();
			creado = false;
		}
		cerrarConexionBD();
		return creado;
	}
	
	public UsuarioBD VerUsuarios(int id) {
		
		abrirConexionBD();
		UsuarioBD usuario = new UsuarioBD();
		
		try{
			String con = "SELECT usuario,clave, nombre, direccion, telefono, email FROM usuarios WHERE codigo=?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setInt(1,id);
			ResultSet resultado = s.executeQuery();
						
			while(resultado.next()) {
				usuario.setUsuario(resultado.getString("usuario"));
				usuario.setClave(resultado.getString("clave"));
				usuario.setNombre(resultado.getString("nombre"));
				usuario.setDireccion(resultado.getString("direccion"));
				usuario.setTelefono(resultado.getString("telefono"));
				usuario.setCorreo(resultado.getString("email"));
				usuario.setCodigo(id);
			}
		}
		catch(Exception e) { // Error en la conexión con la BD
			e.printStackTrace();
			
		}
		cerrarConexionBD();
		return usuario;
		
	}
	
	public boolean modificarContrasena(String nueva, String nueva2, String antigua, int codigo)
	{
		boolean actualizado = false;
		abrirConexionBD();
		try {
			String con = "UPDATE usuarios SET clave = md5(?) WHERE codigo = ? ";
			String con2 ="SELECT * FROM usuarios WHERE codigo = ? AND clave = md5(?)";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, nueva);
			s.setInt(2, codigo);
			PreparedStatement s2 = conexionBD.prepareStatement(con2);
			s2.setInt(1, codigo);
			s2.setString(2, antigua);
			ResultSet resultado = s2.executeQuery();
				if(resultado.next() && nueva.equals(nueva2)) {
					s.execute();
					actualizado = s.getUpdateCount()>0;
				}
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return actualizado;
	}
	
	public boolean modificarUsuario(String campo, String valor, int codigo) throws SQLException
	{
		boolean actualizado = false;
		abrirConexionBD();
		
		try {
			String con = "UPDATE usuarios SET " + campo + " = ? WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, valor);
			s.setInt(2, codigo);
			s.execute();
			
			actualizado = (s.getUpdateCount()>0);
			
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		cerrarConexionBD();
		return actualizado;
	
	}

	//#endregion
	//#region Pedidos
	
	public int registrarPedido(int usuario, ArrayList<ProductoCarrito> productos) {
	    abrirConexionBD();
	    int codigoGenerado = -1; // Valor por defecto en caso de error
	    float preciotot = 0;
	    try {
	        for (int i = 0; i < productos.size(); i++) {
	            preciotot += productos.get(i).getPrecio() * productos.get(i).getCantidad();
	        }

			LocalDate fechaActual = LocalDate.now();
			Date fecha = Date.valueOf(fechaActual);

	        String con = "INSERT INTO pedidos (codigo, persona, fecha, importe, estado) VALUES (NULL, ?, ?, ?, null);";

	        PreparedStatement s = conexionBD.prepareStatement(con, Statement.RETURN_GENERATED_KEYS);
	        s.setInt(1, usuario);
			s.setDate(2, fecha);
	        s.setFloat(3, preciotot);
	        s.executeUpdate();

	        ResultSet rs = s.getGeneratedKeys();
	        if (rs.next()) {
	            codigoGenerado = rs.getInt(1); // Obtener el valor del código generado
	        }
	    } catch (Exception e) { // Error en la conexión con la BD
	        e.printStackTrace();
	    } finally {
	        cerrarConexionBD();
	    }
	    return codigoGenerado;
	}
	
	public boolean anyadeProdPedido(ProductoBD prod, int codPedido, int cantidad) throws SQLException
	{
		abrirConexionBD();
		
		String con = "INSERT INTO detalle (codigo_pedido, codigo_producto, unidades, precio_unitario) VALUES(?,?,?,?); ";
		PreparedStatement s = conexionBD.prepareStatement(con);
		s.setInt(2, prod.getCodigo());
		s.setInt(1, codPedido);
		s.setInt(3, cantidad);
		s.setFloat(4, prod.getPrecio());
		s.execute();
		
		return true;
	}

	public PedidoBD obtenerPedido(int codigo)
	{
		abrirConexionBD();
		PedidoBD pedido = new PedidoBD();
		try {
			String con = "SELECT * FROM pedidos WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setInt(1, codigo);
			ResultSet resultado = s.executeQuery();
			
			while(resultado.next()) {
				pedido.setCodigo(resultado.getInt("codigo"));
				pedido.setCodigoCliente(resultado.getInt("persona"));
				pedido.setFecha(resultado.getDate("fecha"));
				pedido.setTotal(resultado.getFloat("importe"));
				pedido.setEstado(resultado.getString("estado"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return pedido;
	}
	
	public int[] buscaPedidoUsu(int codUsu) throws SQLException {
	    abrirConexionBD();
	    int[] pedidos = null;

	    String con = "SELECT codigo FROM pedidos WHERE persona = ?;";
	    PreparedStatement s = conexionBD.prepareStatement(con, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    s.setInt(1, codUsu);

	    ResultSet resultado = s.executeQuery();

	    resultado.last();
	    int rowCount = resultado.getRow();
	    resultado.beforeFirst();

	    if (rowCount > 0) {
	        pedidos = new int[rowCount];
	        int index = 0;

	        while (resultado.next()) {
	            int codigoPedido = resultado.getInt("codigo");
	            pedidos[index] = codigoPedido;
	            index++;
	        }
	    }

	    cerrarConexionBD();
	    return pedidos;
	}
	
public List<DetallesPedido> verDetalles(int codigo) throws SQLException
{
	abrirConexionBD();
	
	List<DetallesPedido> res = new ArrayList<DetallesPedido>();
	

	
	try {
		// hay que tener en cuenta las columnas de vuestra tabla de productos
		// también se puede utilizar una consulta del tipo:
		// con = "SELECT * FROM productos";
		String con = "Select * FROM detalle WHERE codigo_pedido = ?";
		PreparedStatement s = conexionBD.prepareStatement(con);
		s.setInt(1, codigo);
		ResultSet resultado = s.executeQuery();
		
		while(resultado.next()){
			DetallesPedido dp = new DetallesPedido();
			dp.setCantidad(resultado.getInt("unidades"));
			dp.setCodPedido(codigo);
			dp.setCodProd(resultado.getInt("codigo_producto"));
			dp.setPrecio(resultado.getFloat("precio_unitario"));
			res.add(dp);
	}
}
catch(Exception e) {
	System.err.println("Error ejecutando la consulta a la base de datos");
	System.err.println(e.getMessage());
}
	return res;
	
}
	

public int cancelarPedido(int codigo) throws SQLException
{
	abrirConexionBD();
	
	String con = "UPDATE pedidos SET estado = 4 WHERE codigo = ?";
	PreparedStatement s = conexionBD.prepareStatement(con);
	s.setInt(1, codigo);
	s.executeUpdate();
	
	return s.getUpdateCount();
}

public int eliminarPedido(int codigo) throws SQLException
{
	abrirConexionBD();
	
	String con = "DELETE FROM pedidos WHERE codigo = ?";

	String con2 = "DELETE FROM detalle WHERE codigo_pedido = ?";
    PreparedStatement s2 = conexionBD.prepareStatement(con2);
    s2.setInt(1, codigo);
    s2.executeUpdate();

	PreparedStatement s = conexionBD.prepareStatement(con);
	s.setInt(1, codigo);
	s.executeUpdate();

	return s.getUpdateCount();
}

	//#endregion
	//#region
	
	
//#endregion	


}
