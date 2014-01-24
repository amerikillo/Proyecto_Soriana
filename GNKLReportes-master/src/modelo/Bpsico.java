package modelo;

public class Bpsico {
	private String id;
	private String lab;
	private String des;
	private String pres;
	private String jsonDato;
	
	public Bpsico(String id, String lab, String des, String pres) {
		this.id = id;
		this.lab = lab;
		this.des = des;
		this.pres = pres;
		this.jsonDato="";
	}
	
	public Bpsico() {
		this.id = "";
		this.lab = "";
		this.des = "";
		this.pres = "";
		this.jsonDato="";
	}

	public String getJsonDato() {
		return jsonDato;
	}

	public void setJsonDato(String jsonDato) {
		this.jsonDato = jsonDato;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLab() {
		return lab;
	}

	public void setLab(String lab) {
		this.lab = lab;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getPres() {
		return pres;
	}

	public void setPres(String pres) {
		this.pres = pres;
	}

}
