package modelo;

public class Brepor10 {
	private String clave;
	private String descripcion;
	private int existencia;
	private int stock_max;
	private int stock_min;
	
	public Brepor10(String clave, String descripcion, int existencia,
			int stock_max, int stock_min) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.existencia = existencia;
		this.stock_max = stock_max;
		this.stock_min = stock_min;
	}
	
	public Brepor10() {
		this.clave = "";
		this.descripcion = "";
		this.existencia = 0;
		this.stock_max = 0;
		this.stock_min = 0;
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

	public int getExistencia() {
		return existencia;
	}

	public void setExistencia(int existencia) {
		this.existencia = existencia;
	}

	public int getStock_max() {
		return stock_max;
	}

	public void setStock_max(int stock_max) {
		this.stock_max = stock_max;
	}

	public int getStock_min() {
		return stock_min;
	}

	public void setStock_min(int stock_min) {
		this.stock_min = stock_min;
	}
}
