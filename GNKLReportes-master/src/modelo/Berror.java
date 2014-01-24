package modelo;
import java.util.*;

public class Berror {
	
	private String error;
	private ArrayList<String[]> msj;

	public Berror(String error) {
		this.error = error;
	}
	
	public Berror() {
		this.error = "";
		this.msj=new ArrayList<String[]>();
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public ArrayList<String[]> getMsj() {
		return msj;
	}

	public void setMsj(ArrayList<String[]> lista) {
		this.msj = lista;
	}
	
}
