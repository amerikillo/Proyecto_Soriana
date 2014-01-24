package modelo;
import java.util.*;

public class Breceta {
	private int folio;
	private String tipo_receta;
	private String fecha;
	private String programa;
	private String unidad;
	private int id_unidad;
	private int jurisdiccion;
	private String beneficiario;
	private int edad;
	private int num_seguro;
	private String nombre_medico;
	private int cedula;
	private String causes;
	private ArrayList<Binsumo> contenido;
	private String error;
	
	public Breceta(int folio, String tipo, String fecha, String programa, String unidad,
			int jurisdiccion, String beneficiario, int edad, int num_seguro,
			String nombre_medico, int cedula, String causes, int id_uni,
			ArrayList<Binsumo> contenido) {
		this.folio = folio;
		this.tipo_receta= tipo;
		this.fecha = fecha;
		this.programa = programa;
		this.unidad = unidad;
		this.jurisdiccion = jurisdiccion;
		this.beneficiario = beneficiario;
		this.edad = edad;
		this.num_seguro = num_seguro;
		this.nombre_medico = nombre_medico;
		this.cedula = cedula;
		this.causes = causes;
		this.contenido = contenido;
		this.id_unidad=id_uni;
	}
	
	public Breceta() {
		this.folio = 0;
		this.fecha = "";
		this.programa = "";
		this.unidad = "";
		this.jurisdiccion = 0;
		this.beneficiario = "";
		this.edad = 0;
		this.num_seguro = 0;
		this.nombre_medico = "";
		this.cedula = 0;
		this.causes = "";
		this.contenido = new ArrayList<Binsumo>();
	}

	public int getFolio() {
		return folio;
	}

	public void setFolio(int folio) {
		this.folio = folio;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getPrograma() {
		return programa;
	}

	public void setPrograma(String programa) {
		this.programa = programa;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public int getJurisdiccion() {
		return jurisdiccion;
	}

	public void setJurisdiccion(int jurisdiccion) {
		this.jurisdiccion = jurisdiccion;
	}

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public int getNum_seguro() {
		return num_seguro;
	}

	public void setNum_seguro(int num_seguro) {
		this.num_seguro = num_seguro;
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

	public String getCauses() {
		return causes;
	}

	public void setCauses(String causes) {
		this.causes = causes;
	}

	public ArrayList<Binsumo> getContenido() {
		return contenido;
	}

	public void setContenido(ArrayList<Binsumo> contenido) {
		this.contenido = contenido;
	}

	public int getId_unidad() {
		return id_unidad;
	}

	public void setId_unidad(int id_unidad) {
		this.id_unidad = id_unidad;
	}

	public String getTipo_receta() {
		return tipo_receta;
	}

	public void setTipo_receta(String tipo_receta) {
		this.tipo_receta = tipo_receta;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
	
	
}
