package modelo;

public class Brepor19 {
	private String tipo;
	private String clave;
	private String nombre_generico;
	private String descripcion;
	private String presentacion;
	private int total_solicitado;
	private int total_surtido;
	private String desplazamiento;
	private float procentaje;
	private String observaciones;
	
	public Brepor19(String tipo, String clave, String nombre_generico,
			String descripcion, String presentacion, int total_solicitado,
			int total_surtido, String desplazamiento, float procentaje,
			String observaciones) {
		this.tipo = tipo;
		this.clave = clave;
		this.nombre_generico = nombre_generico;
		this.descripcion = descripcion;
		this.presentacion = presentacion;
		this.total_solicitado = total_solicitado;
		this.total_surtido = total_surtido;
		this.desplazamiento = desplazamiento;
		this.procentaje = procentaje;
		this.observaciones = observaciones;
	}
	
	public Brepor19(String tipo, String clave, String nombre_generico,
			String descripcion, String presentacion, int total_solicitado,
			int total_surtido, float procentaje) {
		this.tipo = tipo;
		this.clave = clave;
		this.nombre_generico = nombre_generico;
		this.descripcion = descripcion;
		this.presentacion = presentacion;
		this.total_solicitado = total_solicitado;
		this.total_surtido = total_surtido;
		this.desplazamiento = "";
		this.procentaje = procentaje;
		this.observaciones = "";
	}
	
	public Brepor19() {
		this.tipo = "";
		this.clave = "";
		this.nombre_generico = "";
		this.descripcion = "";
		this.presentacion = "";
		this.total_solicitado = 0;
		this.total_surtido = 0;
		this.desplazamiento = "";
		this.procentaje = 0;
		this.observaciones = "";
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getNombre_generico() {
		return nombre_generico;
	}

	public void setNombre_generico(String nombre_generico) {
		this.nombre_generico = nombre_generico;
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

	public int getTotal_solicitado() {
		return total_solicitado;
	}

	public void setTotal_solicitado(int total_solicitado) {
		this.total_solicitado = total_solicitado;
	}

	public int getTotal_surtido() {
		return total_surtido;
	}

	public void setTotal_surtido(int total_surtido) {
		this.total_surtido = total_surtido;
	}

	public String getDesplazamiento() {
		return desplazamiento;
	}

	public void setDesplazamiento(String desplazamiento) {
		this.desplazamiento = desplazamiento;
	}

	public float getProcentaje() {
		return procentaje;
	}

	public void setProcentaje(float procentaje) {
		this.procentaje = procentaje;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
}
