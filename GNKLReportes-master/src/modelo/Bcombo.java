package modelo;
import java.util.ArrayList;

public class Bcombo {
	
	private ArrayList<String> datos;
	private ArrayList<String> id;
	private String jsonDato;

	public Bcombo() {
		this.datos = new ArrayList<String>();
		this.id = new ArrayList<String>();
		this.jsonDato ="";
	}

	public ArrayList<String> getDatos() {
		return datos;
	}

	public ArrayList<String> getId() {
		return id;
	}

	public void agregarDato(String dato){
		this.datos.add(dato);
	}
	
	public void agregarId(String id){
		this.id.add(id);
	}

	public String getJsonDato() {
		return jsonDato;
	}

	public void setJsonDato(String jsonDato) {
		this.jsonDato = jsonDato;
	}
	
	
	
}
