package modelo;

public class Bbien {
	private boolean respuesta;
	private boolean error;

	public Bbien(boolean respuesta) {
		this.respuesta = respuesta;
	}
	
	public Bbien() {
		this.respuesta = false;
		this.error = false;
	}

	public boolean isRespuesta() {
		return respuesta;
	}

	public void setRespuesta(boolean respuesta) {
		this.respuesta = respuesta;
	}

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}
	
}
