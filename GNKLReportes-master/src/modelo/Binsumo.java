package modelo;

public class Binsumo {
	private String clave;
	private String descripcion;
	private int cant_surtida;
	private int cant_solicitada;
	private boolean surtio;
	private int id_origen;
	
	public Binsumo(String clave, String descripcion, int cant_surtida,
			int cant_solicitada, int origen) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.cant_surtida = cant_surtida;
		this.cant_solicitada = cant_solicitada;
		this.id_origen = origen;
		if(cant_surtida == cant_solicitada){
			this.surtio = true;
		}else{
			this.surtio = false;
		}
	}
	
	public Binsumo() {
		this.clave = "";
		this.descripcion = "";
		this.cant_surtida = 0;
		this.cant_solicitada = 0;
		this.surtio = false;
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

	public int getCant_surtida() {
		return cant_surtida;
	}

	public void setCant_surtida(int cant_surtida) {
		this.cant_surtida = cant_surtida;
	}

	public int getCant_solicitada() {
		return cant_solicitada;
	}

	public void setCant_solicitada(int cant_solicitada) {
		this.cant_solicitada = cant_solicitada;
	}

	public boolean isSurtio() {
		return surtio;
	}

	public void setSurtio(boolean surtio) {
		this.surtio = surtio;
	}

	public int getId_origen() {
		return id_origen;
	}

	public void setId_origen(int id_origen) {
		this.id_origen = id_origen;
	}
	
}
