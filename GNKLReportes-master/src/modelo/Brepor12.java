package modelo;

public class Brepor12 {
	private String clave;
	private String descripcion;
	private int incidencias;
	
	public Brepor12(String clave, String descripcion, int incidencias) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.incidencias = incidencias;
	}
	
	public Brepor12() {
		this.clave = "";
		this.descripcion = "";
		this.incidencias = 0;
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

	public int getIncidencias() {
		return incidencias;
	}

	public void setIncidencias(int incidencias) {
		this.incidencias = incidencias;
	}
}
