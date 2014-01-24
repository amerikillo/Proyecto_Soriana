package modelo;
import java.util.*;

public class Btabla {

	private ArrayList<Object> tabla;
	private ArrayList<Float> totales;
	private ArrayList<String> datos;
	private int[] cantidades;
	private int cant_medi=0;
	private int cant_material=0;
	private int cant_otros=0;
	private int cant_general=0;
	private float imp_medi=0;
	private float imp_material=0;
	private float imp_otro=0;
	private float imp_general=0;

	public Btabla() {
		this.tabla = new ArrayList<Object>();
		this.totales = new ArrayList<Float>();
		this.datos = new ArrayList<String>();
		this.cantidades = new int[40];
		for(int k=0; k<40; k++){
			cantidades[k]=0;
		}
	}

	
	public ArrayList<String> getDatos() {
		return datos;
	}

	public ArrayList<Object> getTabla() {
		return tabla;
	}
	
	public ArrayList<Float> getTotales(){
		return totales;
	}
	
	public int[] getCantidades(){
		return cantidades;
	}

	public void agregar(Object dato){
		tabla.add(dato);
	}
	
	public void agregarDato(String cadena){
		this.datos.add(cadena);
	}
	
	public void agregarTotal(float total){
		totales.add(total);
	}
	
	public void agregarCantidades(int cantidad, int pos){
		cantidades[pos]=cantidad;
	}

	public int getCant_medi() {
		return cant_medi;
	}

	public void setCant_medi(int cant_medi) {
		this.cant_medi = cant_medi;
	}

	public int getCant_material() {
		return cant_material;
	}

	public void setCant_material(int cant_material) {
		this.cant_material = cant_material;
	}

	public int getCant_otros() {
		return cant_otros;
	}

	public void setCant_otros(int cant_otros) {
		this.cant_otros = cant_otros;
	}

	public int getCant_general() {
		return cant_general;
	}

	public void setCant_general(int cant_general) {
		this.cant_general = cant_general;
	}

	public float getImp_medi() {
		return imp_medi;
	}

	public void setImp_medi(float imp_medi) {
		this.imp_medi = imp_medi;
	}

	public float getImp_material() {
		return imp_material;
	}

	public void setImp_material(float imp_material) {
		this.imp_material = imp_material;
	}

	public float getImp_otro() {
		return imp_otro;
	}

	public void setImp_otro(float imp_otro) {
		this.imp_otro = imp_otro;
	}

	public float getImp_general() {
		return imp_general;
	}

	public void setImp_general(float imp_general) {
		this.imp_general = imp_general;
	}

	public void setTabla(ArrayList<Object> tabla) {
		this.tabla = tabla;
	}
	
	
}
