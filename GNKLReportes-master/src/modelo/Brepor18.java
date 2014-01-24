package modelo;

public class Brepor18 {
	private String clave;
	private String descripcion;
	private float precio_licitado;
	private float admon;
	private float precio_base;
	private int año;
	private int cantidad;
	private float total;
	private int inventario_recibido;
	private int origen_ssd;
	private int origen_soriana;
	private float importe_precio_licitacion;
	private float importe_serv_admon;
	private float importe_precio_base;
	
	public Brepor18(String clave, String descripcion, float precio_licitado,
			float precio_base, int cantidad, float total,
			int inventario_recibido,float importe_precio_licitacion,
			float importe_serv_admon, float importe_precio_base) {
		this.clave = clave;
		this.descripcion = descripcion;
		this.precio_licitado = precio_licitado;
		this.admon = (float)7.45;
		this.precio_base = precio_base;
		this.año = 2012;
		this.cantidad = cantidad;
		this.total = total;
		this.inventario_recibido = inventario_recibido;
		if(inventario_recibido==1){
			this.origen_ssd = 1;
			this.origen_soriana = 0;
		}else{
			this.origen_ssd = 0;
			this.origen_soriana = 2;
		}
		this.importe_precio_licitacion = importe_precio_licitacion;
		this.importe_serv_admon = importe_serv_admon;
		this.importe_precio_base = importe_precio_base;
	}
	
	public Brepor18() {
		this.clave = "";
		this.descripcion = "";
		this.precio_licitado = 0;
		this.admon = 0;
		this.precio_base = 0;
		this.año = 0;
		this.cantidad = 0;
		this.total = 0;
		this.inventario_recibido = 0;
		this.origen_ssd = 0;
		this.origen_soriana = 0;
		this.importe_precio_licitacion = 0;
		this.importe_serv_admon = 0;
		this.importe_precio_base = 0;
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

	public float getPrecio_licitado() {
		return precio_licitado;
	}

	public void setPrecio_licitado(float precio_licitado) {
		this.precio_licitado = precio_licitado;
	}

	public float getAdmon() {
		return admon;
	}

	public void setAdmon(float admon) {
		this.admon = admon;
	}

	public float getPrecio_base() {
		return precio_base;
	}

	public void setPrecio_base(float precio_base) {
		this.precio_base = precio_base;
	}

	public int getAño() {
		return año;
	}

	public void setAño(int año) {
		this.año = año;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getInventario_recibido() {
		return inventario_recibido;
	}

	public void setInventario_recibido(int inventario_recibido) {
		this.inventario_recibido = inventario_recibido;
	}

	public int getOrigen_ssd() {
		return origen_ssd;
	}

	public void setOrigen_ssd(int origen_ssd) {
		this.origen_ssd = origen_ssd;
	}

	public int getOrigen_soriana() {
		return origen_soriana;
	}

	public void setOrigen_soriana(int origen_soriana) {
		this.origen_soriana = origen_soriana;
	}

	public float getImporte_precio_licitacion() {
		return importe_precio_licitacion;
	}

	public void setImporte_precio_licitacion(float importe_precio_licitacion) {
		this.importe_precio_licitacion = importe_precio_licitacion;
	}

	public float getImporte_serv_admon() {
		return importe_serv_admon;
	}

	public void setImporte_serv_admon(float importe_serv_admon) {
		this.importe_serv_admon = importe_serv_admon;
	}

	public float getImporte_precio_base() {
		return importe_precio_base;
	}

	public void setImporte_precio_base(float importe_precio_base) {
		this.importe_precio_base = importe_precio_base;
	}
}
