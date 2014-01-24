package modelo;

public class Brepor13 {
	private int folio;
	private String clave;
	private String descripcion;
	private int cantidad;
	private String fecha_solicitud;
	private String fecha_abasto;
	private int dias_atraso;
	private int origen;
	private float precio;
	private float importe;
	
	public Brepor13(int folio, String clave, String descripcion, int cantidad,
			String fecha_solicitud, String fecha_abasto, int dias_atraso,
			int origen, float precio, float importe) {
		this.folio = folio;
		this.clave = clave;
		this.descripcion = descripcion;
		this.cantidad = cantidad;
		this.fecha_solicitud = fecha_solicitud;
		this.fecha_abasto = fecha_abasto;
		this.dias_atraso = dias_atraso;
		this.origen = origen;
		this.precio = precio;
		this.importe = importe;
	}
	
	public Brepor13() {
		this.folio = 0;
		this.clave = "";
		this.descripcion = "";
		this.cantidad = 0;
		this.fecha_solicitud = "";
		this.fecha_abasto = "";
		this.dias_atraso = 0;
		this.origen = 0;
		this.precio = 0;
		this.importe = 0;
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

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getFecha_solicitud() {
		return fecha_solicitud;
	}

	public void setFecha_solicitud(String fecha_solicitud) {
		this.fecha_solicitud = fecha_solicitud;
	}

	public String getFecha_abasto() {
		return fecha_abasto;
	}

	public void setFecha_abasto(String fecha_abasto) {
		this.fecha_abasto = fecha_abasto;
	}

	public int getDias_atraso() {
		return dias_atraso;
	}

	public void setDias_atraso(int dias_atraso) {
		this.dias_atraso = dias_atraso;
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

	public float getImporte() {
		return importe;
	}

	public void setImporte(float importe) {
		this.importe = importe;
	}
}
