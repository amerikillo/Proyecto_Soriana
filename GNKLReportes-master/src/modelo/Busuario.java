package modelo;

public class Busuario {
	private String usuario;
	private String roll;
	private int id;
	
	public Busuario() {
		this.usuario = "";
		this.roll = "";
	}
	
	public Busuario(String usuario, String roll) {
		this.usuario = usuario;
		this.roll = roll;
	}
	
	public Busuario(int id, String usuario, String roll) {
		this.usuario = usuario;
		this.roll = roll;
		this.id=id;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
