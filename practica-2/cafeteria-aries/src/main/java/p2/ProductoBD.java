package p2;

public class ProductoBD {

	private int codigo;
	private String descripcion;
	private float precio;
	private int stock;
	private String imagen;
	private String tipo;
	private String ingredientes;
	private boolean novedades;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	public String getTipo()
	{
		return tipo;
	}
	
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getIngredientes()
	{
		return ingredientes;
	}
	
	public void setIngredientes(String ingredientes)
	{
		this.ingredientes = ingredientes;
	}

	public boolean getNovedad() {
		return novedades;
	}
	public void setNovedad(boolean nov)
	{
		this.novedades = nov;
	}
}
