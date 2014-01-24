package modelo;

public class Brepor2 {
	private String clave;
	private String desc;
	private String presentacion;
	private int cantidad;
	private float precio;
	private float importe;
	
	public Brepor2(String clave, String desc, String presentacion, int cantidad, float precio, float importe) {
		
		this.clave = clave;
		this.desc = desc;
		this.presentacion = presentacion;
		this.cantidad = cantidad;
		this.precio = precio;
		this.importe = importe;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
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
