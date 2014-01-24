package modelo;

public class Brepor6 {
	private String clave;
	private String descripcion;
	private int cantidad;
	private float precio;
	private float importe;
	private int cant1;//lunes
	private int cant2;//martes
	private int cant3;//miercoles
	private int cant4;//jueves
	private int cant5;//viernes
	private int cant6;//sabado
	private int cant7;//domingo
	
	public Brepor6(String clave, String descripcion, int cantidad, float precio, float importe) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.cantidad = cantidad;
		this.precio = precio;
		this.importe = importe;
	}
	
	public Brepor6() {
		this.clave = "";
		this.descripcion = "";
		this.cantidad = 0;
		this.precio = 0;
		this.importe= 0;
		this.cant1 = 0;
		this.cant2 = 0;
		this.cant3 = 0;
		this.cant4 = 0;
		this.cant5 = 0;
		this.cant6 = 0;
		this.cant7 = 0;
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

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public int getCant1() {
		return cant1;
	}

	public void setCant1(int cant1) {
		this.cant1 = cant1;
	}

	public int getCant2() {
		return cant2;
	}

	public void setCant2(int cant2) {
		this.cant2 = cant2;
	}

	public int getCant3() {
		return cant3;
	}

	public void setCant3(int cant3) {
		this.cant3 = cant3;
	}

	public int getCant4() {
		return cant4;
	}

	public void setCant4(int cant4) {
		this.cant4 = cant4;
	}

	public int getCant5() {
		return cant5;
	}

	public void setCant5(int cant5) {
		this.cant5 = cant5;
	}

	public int getCant6() {
		return cant6;
	}

	public void setCant6(int cant6) {
		this.cant6 = cant6;
	}

	public int getCant7() {
		return cant7;
	}

	public void setCant7(int cant7) {
		this.cant7 = cant7;
	}
	
	public float getImporte() {
		return importe;
	}

	public void setImporte(float importe) {
		this.importe = importe;
	}

	public void setCantidadSemana(int cantidad, int semana){
		if(semana==1){
			this.cant1=cantidad;
		}else if(semana==2){
			this.cant2=cantidad;
		}else if(semana==3){
			this.cant3=cantidad;
		}else if(semana==4){
			this.cant4=cantidad;
		}else if(semana==5){
			this.cant5=cantidad;
		}else if(semana==6){
			this.cant6=cantidad;
		}else{
			this.cant7=cantidad;
		}
	}

}
