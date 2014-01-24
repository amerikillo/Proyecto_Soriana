package modelo;

public class Brepor15 {
	private int num;
	private String medico;
	private int cedula;
	private String domicilio;
	private String fecha_entrada;
	private int no_factura;
	private String domicilio_proveedor;
	private int entrada;
	private int salida;
	private int saldo;
	private String observacion;
	
	public Brepor15(int num, String medico, int cedula, String domicilio,
			String fecha_entrada, int no_factura, String domicilio_proveedor,
			int entrada, int salida, int saldo, String observacion) {
		this.num = num;
		this.medico = medico;
		this.cedula = cedula;
		this.domicilio = domicilio;
		this.fecha_entrada = fecha_entrada;
		this.no_factura = no_factura;
		this.domicilio_proveedor = domicilio_proveedor;
		this.entrada = entrada;
		this.salida = salida;
		this.saldo = saldo;
		this.observacion = observacion;
	}
	
	public Brepor15(int id, String nombre, int cedula, String domicilio_medico, int cant_surtida, int saldo, String clave){
		this.num = id;
		this.medico = nombre;
		this.cedula = cedula;
		this.domicilio = domicilio_medico;
		
		this.fecha_entrada = "";
		this.no_factura = 0;
		this.domicilio_proveedor = "";
		this.entrada = 0;
		
		this.salida = cant_surtida;
		this.saldo = saldo;
		this.observacion = "Clave medicamento" + clave;
	}
	
	public Brepor15() {
		this.num = 0;
		this.medico = "";
		this.cedula = 0;
		this.domicilio = "";
		this.fecha_entrada = "";
		this.no_factura = 0;
		this.domicilio_proveedor = "";
		this.entrada = 0;
		this.salida = 0;
		this.saldo = 0;
		this.observacion = "";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMedico() {
		return medico;
	}

	public void setMedico(String medico) {
		this.medico = medico;
	}

	public int getCedula() {
		return cedula;
	}

	public void setCedula(int cedula) {
		this.cedula = cedula;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getFecha_entrada() {
		return fecha_entrada;
	}

	public void setFecha_entrada(String fecha_entrada) {
		this.fecha_entrada = fecha_entrada;
	}

	public int getNo_factura() {
		return no_factura;
	}

	public void setNo_factura(int no_factura) {
		this.no_factura = no_factura;
	}

	public String getDomicilio_proveedor() {
		return domicilio_proveedor;
	}

	public void setDomicilio_proveedor(String domicilio_proveedor) {
		this.domicilio_proveedor = domicilio_proveedor;
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

	public int getSaldo() {
		return saldo;
	}

	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

}
