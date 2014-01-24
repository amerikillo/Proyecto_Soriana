package modelo;

public class Brepor17 {
	private String clave;
	private String descripcion;
	private String presentacion;
	private int cantidad;
	
	public Brepor17(String clave, String descripcion, String presentacion,
			int cantidad) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.presentacion = presentacion;
		this.cantidad = cantidad;
	}
	
	public Brepor17() {
		this.clave = "";
		this.descripcion = "";
		this.presentacion = "";
		this.cantidad = 0;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getPresentacion() {
		return presentacion;
	}

	public void setPresentacion(String presentacion) {
		this.presentacion = presentacion;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}	

}
