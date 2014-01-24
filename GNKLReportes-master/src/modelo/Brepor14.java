package modelo;

public class Brepor14 {
	private String unidad;
	private int folio;
	private String clave;
	private String descripcion;
	private String fecha_solicitud;
	private int cant_no_dispensada;
	private float precio;
	private float importe;
	
	public Brepor14(String unidad, int folio, String clave, String descripcion, String fecha_solicitud,
			int cant_no_dispensada, float precio, float importe) {
		this.unidad = unidad;
		this.folio = folio;
		this.clave = clave;
		this.descripcion = descripcion;
		this.fecha_solicitud = fecha_solicitud;
		this.cant_no_dispensada = cant_no_dispensada;
		this.precio = precio;
		this.importe = importe;
	}
	
	public Brepor14() {
		this.unidad = "";
		this.folio = 0;
		this.clave = "";
		this.descripcion = "";
		this.fecha_solicitud = "";
		this.cant_no_dispensada = 0;
		this.precio = 0;
		this.importe = 0;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public int getFolio() {
		return folio;
	}

	public void setFolio(int folio) {
		this.folio = folio;
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

	public int getCant_no_dispensada() {
		return cant_no_dispensada;
	}

	public void setCant_no_dispensada(int cant_no_dispensada) {
		this.cant_no_dispensada = cant_no_dispensada;
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

	public String getFecha_solicitud() {
		return fecha_solicitud;
	}

	public void setFecha_solicitud(String fecha_solicitud) {
		this.fecha_solicitud = fecha_solicitud;
	}

}
