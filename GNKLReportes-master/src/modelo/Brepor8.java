package modelo;

public class Brepor8 {
	private int folio;
	private String fecha;
	private String descripcion;
	private int origen;
	private float precio;
	private int cantidad;
	private float importe;
	
	public Brepor8(int folio, String fecha, String descripcion,
			int origen, float precio, int cantidad, float importe) {
		this.folio = folio;
		this.fecha = fecha;
		this.descripcion = descripcion;
		this.origen = origen;
		this.precio = precio;
		this.cantidad = cantidad;
		this.importe = importe;
	}
	
	public Brepor8() {
		this.folio = 0;
		this.fecha = "";
		this.descripcion = "";
		this.origen = 0;
		this.precio = 0;
		this.cantidad = 0;
		this.importe = 0;
	}

	public int getFolio() {
		return folio;
	}

	public void setFolio(int folio) {
		this.folio = folio;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getOrigen() {
		return origen;
	}

	public void setOrigen(int origen) {
		this.origen = origen;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getImporte() {
		return importe;
	}

	public void setImporte(float importe) {
		this.importe = importe;
	}
}
