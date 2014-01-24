package modelo;

public class Brepor5 {
	private int id;
	private int folio;
	private String fecha;
	private String beneficiario;
	private String descripcion;
	private String presentacion;
	private int origen;
	private float precio;
	private int cantidad;
	private float importe;
	
	public Brepor5(int id, int folio, String fecha, String beneficiario,
			String descripcion, String presentacion, int origen,
			float precio, int cantidad, float importe) {
		this.id = id;
		this.folio = folio;
		this.fecha = fecha;
		this.beneficiario = beneficiario;
		this.descripcion = descripcion;
		this.presentacion = presentacion;
		this.origen = origen;
		this.precio = precio;
		this.cantidad = cantidad;
		this.importe = importe;
	}
	
	public Brepor5() {
		this.id = 0;
		this.folio = 0;
		this.fecha = "";
		this.beneficiario ="";
		this.descripcion ="";
		this.presentacion ="";
		this.origen = 0;
		this.precio = 0;
		this.cantidad = 0;
		this.importe = 0;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
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
