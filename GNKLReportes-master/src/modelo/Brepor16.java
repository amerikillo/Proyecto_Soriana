package modelo;

public class Brepor16 {
	private String fecha;
	private int entrada;
	private int salida;
	private String descripcion;
	private int no_receta;
	private String beneficiario;
	private String nombre_medico;
	private int cedula;
	private String retiene;
	
	public Brepor16(String fecha, int entrada, int salida, String descripcion,
			int no_receta, String beneficiario, String nombre_medico,
			int cedula, String retiene) {
		this.fecha = fecha;
		this.entrada = entrada;
		this.salida = salida;
		this.descripcion = descripcion;
		this.no_receta = no_receta;
		this.beneficiario = beneficiario;
		this.nombre_medico = nombre_medico;
		this.cedula = cedula;
		this.retiene = retiene;
	}

	public Brepor16() {
		this.fecha = "";
		this.entrada = 0;
		this.salida = 0;
		this.descripcion = "";
		this.no_receta = 0;
		this.beneficiario = "";
		this.nombre_medico = "";
		this.cedula = 0;
		this.retiene = "";
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public int getEntrada() {
		return entrada;
	}

	public void setEntrada(int entrada) {
		this.entrada = entrada;
	}

	public int getSalida() {
		return salida;
	}

	public void setSalida(int salida) {
		this.salida = salida;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getNo_receta() {
		return no_receta;
	}

	public void setNo_receta(int no_receta) {
		this.no_receta = no_receta;
	}

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

	public String getNombre_medico() {
		return nombre_medico;
	}

	public void setNombre_medico(String nombre_medico) {
		this.nombre_medico = nombre_medico;
	}

	public int getCedula() {
		return cedula;
	}

	public void setCedula(int cedula) {
		this.cedula = cedula;
	}

	public String getRetiene() {
		return retiene;
	}

	public void setRetiene(String retiene) {
		this.retiene = retiene;
	}
	
}
