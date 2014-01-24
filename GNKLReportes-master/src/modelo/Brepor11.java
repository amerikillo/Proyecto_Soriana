package modelo;

public class Brepor11 {
	private String clave;
	private String clave_ssd;
	private String descripcion;
	private int cant1;
	private int cant2;
	private int cant3;
	private int cant4;
	private int cant5;
	private int cant6;
	private int cant7;
	private int cant8;
	private int cant9;
	private int cant10;
	private int cant11;
	private int cant12;
	
	public Brepor11(String clave, String clave_ssd, String descripcion, int cant1,
			int cant2, int cant3, int cant4, int cant5, int cant6, int cant7,
			int cant8, int cant9, int cant10, int cant11, int cant12) {
		this.clave = clave;
		this.clave_ssd = clave_ssd;
		this.descripcion = descripcion;
		this.cant1 = cant1;
		this.cant2 = cant2;
		this.cant3 = cant3;
		this.cant4 = cant4;
		this.cant5 = cant5;
		this.cant6 = cant6;
		this.cant7 = cant7;
		this.cant8 = cant8;
		this.cant9 = cant9;
		this.cant10 = cant10;
		this.cant11 = cant11;
		this.cant12 = cant12;
	}
	public Brepor11(String clave, String descripcion){
		this.clave_ssd=clave;
		this.clave=clave;
		this.descripcion=descripcion;
		this.cant1=0;
		this.cant2=0;
		this.cant3=0;
		this.cant4=0;
		this.cant5=0;
		this.cant6=0;
		this.cant7=0;
		this.cant8=0;
		this.cant9=0;
		this.cant10=0;
		this.cant11=0;
		this.cant12=0;
	}
	
	public Brepor11() {
		this.clave = "";
		this.clave_ssd = "";
		this.descripcion = "";
		this.cant1 = 0;
		this.cant2 = 0;
		this.cant3 = 0;
		this.cant4 = 0;
		this.cant5 = 0;
		this.cant6 = 0;
		this.cant7 = 0;
		this.cant8 = 0;
		this.cant9 = 0;
		this.cant10 = 0;
		this.cant11 = 0;
		this.cant12 = 0;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getClave_ssd() {
		return clave_ssd;
	}

	public void setClave_ssd(String clave_ssd) {
		this.clave_ssd = clave_ssd;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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

	public int getCant8() {
		return cant8;
	}

	public void setCant8(int cant8) {
		this.cant8 = cant8;
	}

	public int getCant9() {
		return cant9;
	}

	public void setCant9(int cant9) {
		this.cant9 = cant9;
	}

	public int getCant10() {
		return cant10;
	}

	public void setCant10(int cant10) {
		this.cant10 = cant10;
	}

	public int getCant11() {
		return cant11;
	}

	public void setCant11(int cant11) {
		this.cant11 = cant11;
	}

	public int getCant12() {
		return cant12;
	}

	public void setCant12(int cant12) {
		this.cant12 = cant12;
	}
	
	public void setCantMes(int cantidad, int mes){
		if(mes==1){
			this.cant1=cantidad;
		}else if(mes==2){
			this.cant2=cantidad;
		}else if(mes==3){
			this.cant3=cantidad;
		}else if(mes==4){
			this.cant4=cantidad;
		}else if(mes==5){
			this.cant5=cantidad;
		}else if(mes==6){
			this.cant6=cantidad;
		}else if(mes==7){
			this.cant7=cantidad;
		}else if(mes==8){
			this.cant8=cantidad;
		}else if(mes==9){
			this.cant9=cantidad;
		}else if(mes==10){
			this.cant10=cantidad;
		}else if(mes==11){
			this.cant11=cantidad;
		}else if(mes==12){
			this.cant12=cantidad;
		}
	}
	
}
