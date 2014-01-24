package modelo;

public class Brepor20 {
	private String jurisdiccion;
	private String municipio;
	private String unidad;
	private String clave;
	private String descripcion;
	private int cantidad;
	private float precio;
	private float importe;
	
	public Brepor20(String jurisdiccion, String municipio, String unidad,
			String clave, String descripcion, int cantidad, float precio,
			float importe) {
		this.jurisdiccion = jurisdiccion;
		this.municipio = municipio;
		this.unidad = unidad;
		this.clave = clave;
		this.descripcion = descripcion;
		this.cantidad = cantidad;
		this.precio = precio;
		this.importe = importe;
	}
	
	public Brepor20() {
		this.jurisdiccion = "";
		this.municipio = "";
		this.unidad = "";
		this.clave = "";
		this.descripcion = "";
		this.cantidad = 0;
		this.precio = 0;
		this.importe = 0;
	}

	public String getJurisdiccion() {
		return jurisdiccion;
	}

	public void setJurisdiccion(String jurisdiccion) {
		this.jurisdiccion = jurisdiccion;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
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
