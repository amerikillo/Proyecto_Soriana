package modelo;

public class Brepor21 {
	private String clave;
	private String descripcion;
	private int cantidad;
	private float precio;
	private float importe;
	
	public Brepor21(String clave, String descripcion, int cantidad, float precio,
			float importe) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.cantidad = cantidad;
		this.precio = precio;
		this.importe = importe;
	}
	
	public Brepor21() {
		this.clave = "";
		this.descripcion = "";
		this.cantidad = 0;
		this.precio = 0;
		this.importe = 0;
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

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public float getImporte() {
		return importe;
	}

	public void setImporte(float importe) {
		this.importe = importe;
	}
}
