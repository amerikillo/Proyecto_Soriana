package controlador;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import modelo.*;

public class SqlSentencia {
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*********************************************AUTENTICAR********************************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public boolean autenticar(String usuario, String pass, Busuario user, Berror error){
		boolean res=false;
		BSqlSentencia varsql = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar(error);
			varsql.setPstm(conex.getCon().prepareStatement("call autenticar(?,?)"));
			varsql.getPstm().setString(1, usuario);
			varsql.getPstm().setString(2, pass);
			varsql.setRs(varsql.getPstm().executeQuery());
			if(varsql.getRs()!=null){
				if(varsql.getRs().next()){
					System.out.println("usuario correcto");
					user.setUsuario(varsql.getRs().getString("usuario"));
					user.setRoll(varsql.getRs().getString("rol"));
					res=true;
				}else{
					System.out.println("usurio y/o contraseña incorrecta");
					error.setError(error.getError() + " usuario y/o contraseña incorrecta");
				}
			}else{
				System.out.println("usurio y/o contraseña incorrecta");
				error.setError(error.getError() + " usuario y/o contraseña incorrecta");
			}
			conex.getCon().close();
			return res;
			
		}catch(Exception e){
			System.out.println(e);
			error.setError(error.getError() + e);
			conex.cerrar();
			return res;
		}
		
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*****************************LLENADO DE COMBOS POR DEFECTO PROGRAMA********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void llenaPrograma(Bcombo combo){
		conexion conex=new conexion();
		BSqlSentencia vsql = new BSqlSentencia();
		try{
			conex.conectar();
			vsql.setRs(conex.getCon().createStatement().executeQuery("call programa()"));
			if(vsql.getRs()!=null){
				while(vsql.getRs().next()){
					combo.agregarDato(vsql.getRs().getString("nombre"));
					combo.agregarId(vsql.getRs().getString("id"));
				}
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//****************************************LLENADO DE COMBOS MENU 21********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public String llenaPrograma(){
		conexion conex=new conexion();
		BSqlSentencia vsql = new BSqlSentencia();
		String aux="";
		try{
			conex.conectar();
			vsql.setRs(conex.getCon().createStatement().executeQuery("call jurisdiccion()"));
			if(vsql.getRs()!=null){
				aux="\"" + "Dato" + "\"" + ":" + "[";
				while(vsql.getRs().next()){
					aux += "{" + "\"" + "nombre" + "\"" + ":" + "\"" + vsql.getRs().getString("nombre") + "\""+ "," +"\"" + "id" + "\"" + ":" + "\"" + vsql.getRs().getInt("id") + "\"" + "}" + ",";
				}
				aux=aux.substring(0, aux.length()-1);
			}
			conex.getCon().close();
			return aux;
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
			return aux;
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*****************************LLENADO DE COMBOS POR DEFECTO PSICOTROPICO****************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void llenaPsicotropico(Bcombo combo){
		conexion conex=new conexion();
		BSqlSentencia vsql = new BSqlSentencia();
		try{
			conex.conectar();
			vsql.setRs(conex.getCon().createStatement().executeQuery("call psico_todos()"));
			if(vsql.getRs()!=null){
				while(vsql.getRs().next()){
					combo.agregarDato(vsql.getRs().getString("clave"));
					combo.agregarId(vsql.getRs().getString("clave"));
				}
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//****************************************CONSULTA DE PSICOTROPICO***********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void consultaPsico(Bpsico psi, String dato){
		conexion conex=new conexion();
		BSqlSentencia vsql = new BSqlSentencia();
		try{
			conex.conectar();
			vsql.setPstm(conex.getCon().prepareStatement("call psico_uno(?)"));
			vsql.getPstm().setInt(1, Integer.parseInt(dato));
			vsql.setRs(vsql.getPstm().executeQuery());
			if(vsql.getRs()!=null){
				if(vsql.getRs().next()){
					psi.setId(vsql.getRs().getString("clave"));
					psi.setDes(vsql.getRs().getString("descripcion"));
					psi.setLab(vsql.getRs().getString("lab"));
					psi.setPres(vsql.getRs().getString("presentacion"));
				}
			}
			String aux="\"" + "Dato" + "\"" + ":" + "[";
			if(psi.getId().length()!=0){
				aux += "{" + "\"" + "clave" + "\"" + ":" + "\"" + psi.getId() + "\""+ "," +"\"" + "lab" + "\"" + ":" + "\"" + psi.getLab() + "\"" + ",\"des\":\"" + psi.getDes() + "\"" + ",\"pres\":\"" + psi.getPres() + "\"" + "}";
				psi.setJsonDato(aux);
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//****************************************LLENADO DE COMBOBOX ENCADENADO*****************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void llenaCombo(Bcombo combo, String dato, String caso_sql){
		conexion conex=new conexion();
		BSqlSentencia vsql = new BSqlSentencia();
		try{
			conex.conectar();
			if(dato.equals("")){
				vsql.setRs(conex.getCon().createStatement().executeQuery("call jurisdiccion()"));
			}else{
				if(caso_sql.equals("2") || caso_sql.equals("10"))
					vsql.setPstm(conex.getCon().prepareStatement("call municipio(?)"));
				else if(caso_sql.equals("3") || caso_sql.equals("11"))
					vsql.setPstm(conex.getCon().prepareStatement("call unidad(?)"));
				else if(caso_sql.equals("4"))
					vsql.setPstm(conex.getCon().prepareStatement("call servicio(?)"));
					vsql.getPstm().setString(1, dato);
					vsql.setRs(vsql.getPstm().executeQuery());
			}
			if(vsql.getRs()!=null){
				while(vsql.getRs().next()){
					combo.agregarDato(vsql.getRs().getString("nombre"));
					combo.agregarId(vsql.getRs().getString("id"));
				}
			}
			if(!dato.equals("")){
				String aux="\"" + "Dato" + "\"" + ":" + "[";
				for(int k=0; k<combo.getDatos().size(); k++){
					aux += "{" + "\"" + "nombre" + "\"" + ":" + "\"" + combo.getDatos().get(k) + "\""+ "," +"\"" + "id" + "\"" + ":" + "\"" + combo.getId().get(k) + "\"" + "}" + ",";
				}
				aux=aux.substring(0, aux.length()-1);
				combo.setJsonDato(aux);
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************LLENADO DE COMBOBOX ENCADENADO MEDICO Y BENEFICARIO*********************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void llenaCombo(Bcombo combo, String dato, String fechaI, String fechaF, String casosql){
		System.out.println(dato + " " + fechaI + " " + fechaF);
		conexion conex=new conexion();
		BSqlSentencia vsql = new BSqlSentencia();
		try{
			conex.conectar();
			if(casosql.equals("5"))
				vsql.setPstm(conex.getCon().prepareStatement("call medico(?,?,?)"));
			else
				vsql.setPstm(conex.getCon().prepareStatement("call beneficiario(?,?,?)"));
			vsql.getPstm().setString(1, dato);
			vsql.getPstm().setString(2, fechaI);
			vsql.getPstm().setString(3, fechaF);
			vsql.setRs(vsql.getPstm().executeQuery());
			if(vsql.getRs()!=null){
				while(vsql.getRs().next()){
					combo.agregarDato(vsql.getRs().getString("nombre"));
					if(casosql.equals("5"))
						combo.agregarId(vsql.getRs().getString("cedula_profesional"));
					else
						combo.agregarId(vsql.getRs().getString("id"));
				}
			}
			if(!dato.equals("")){
				String aux="\"" + "Dato" + "\"" + ":" + "[";
				for(int k=0; k<combo.getDatos().size(); k++){
					aux += "{" + "\"" + "nombre" + "\"" + ":" + "\"" + combo.getDatos().get(k) + "\""+ "," +"\"" + "id" + "\"" + ":" + "\"" + combo.getId().get(k) + "\"" + "}" + ",";
				}
				aux=aux.substring(0, aux.length()-1);
				combo.setJsonDato(aux);
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************LLENADO DE COMBOBOX ENCADENADO MEDICO PSICOTROPICO*********************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void llenaCombo(Bcombo combo, String unidad){
		conexion conex = new conexion();
		BSqlSentencia vars = new BSqlSentencia();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call medico_psico(?)"));
			vars.getPstm().setString(1, unidad);
			vars.setRs(vars.getPstm().executeQuery());
			String aux="\"" + "Dato" + "\"" + ":" + "[";
			while(vars.getRs().next()){
				aux += "{" + "\"" + "nombre" + "\"" + ":" + "\"" + vars.getRs().getString("nombre") + "\""+ "," +"\"" + "id" + "\"" + ":" + "\"" + vars.getRs().getInt("cedula_profesional") + "\"" + "}" + ",";
			}
			aux=aux.substring(0, aux.length()-1);
			combo.setJsonDato(aux);
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*********************************************CONTENIDO RECETA********************************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Breceta receta(int folio){
		conexion conex = new conexion();
		BSqlSentencia vars;
		ArrayList<Binsumo> contenido = new ArrayList<Binsumo>();
		Breceta res = new Breceta();
		try{
			conex.conectar();
			vars  = new BSqlSentencia();
			vars.setPstm(conex.getCon().prepareStatement("call contenido_receta(?)"));
			vars.getPstm().setInt(1, folio);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				contenido.add(new Binsumo(vars.getRs().getString("clave"), vars.getRs().getString("descripcion"),
				vars.getRs().getInt("cant_surtida"), vars.getRs().getInt("cant_solicitada"), vars.getRs().getInt("id_origen")));
			}
			vars  = new BSqlSentencia();
			vars.setPstm(conex.getCon().prepareStatement("call recetaF(?)"));
			vars.getPstm().setInt(1, folio);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res = new Breceta(vars.getRs().getInt("folio"), vars.getRs().getString("tipo_receta"), vars.getRs().getString("fecha"), vars.getRs().getString("programa_"),
						vars.getRs().getString("unidad"), vars.getRs().getInt("id"), vars.getRs().getString("paciente"),
						vars.getRs().getInt("edad"), vars.getRs().getInt("num_seguro"), vars.getRs().getString("medico_"),
						vars.getRs().getInt("cedula_profesional"), "causes", Integer.parseInt(vars.getRs().getString("id_unidad").subSequence(1, vars.getRs().getString("id_unidad").length()).toString()), contenido);
			}
			conex.getCon().close();
		}catch(Exception e){
			res.setError(e.toString());
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//************************************REPORTE 2 CONETRADO SALIDA*************************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla concentrado_salidas2(String fechaIni, String fechaFin, int programa, String unidad, int tipo){
		conexion conex = new conexion();
		Btabla tabla = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		try{
			conex.conectar();
			System.out.println( unidad + " " + programa + " " + fechaIni + " " + fechaFin);
			if(tipo == 1)
				vars.setPstm(conex.getCon().prepareStatement("call reporte2SSD(?,?,?,?)"));
			else
				vars.setPstm(conex.getCon().prepareStatement("call reporte2SOR(?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setInt(2, programa);
			vars.getPstm().setString(3, fechaIni);
			vars.getPstm().setString(4, fechaFin);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				if(vars.getRs().getString("tipo").equals("Material de Curacion")){
					tabla.setCant_material(tabla.getCant_material() + vars.getRs().getInt("CANTIDAD"));
					tabla.setImp_material(tabla.getImp_material()+ vars.getRs().getFloat("IMPORTE"));
				}
				else if(vars.getRs().getString("tipo").equals("Otro")){
					tabla.setCant_otros(tabla.getCant_otros() + vars.getRs().getInt("CANTIDAD"));
					tabla.setImp_otro(tabla.getImp_otro() + vars.getRs().getFloat("IMPORTE"));
				}
				else{
					tabla.setCant_medi(tabla.getCant_material() + vars.getRs().getInt("CANTIDAD"));
					tabla.setImp_medi(tabla.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
				}
				tabla.agregar(new Brepor2(vars.getRs().getString("clave"), vars.getRs().getString("descripcion"), vars.getRs().getString("presentacion"), vars.getRs().getInt("CANTIDAD"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getFloat("IMPORTE")));
			}
			tabla.setCant_general(tabla.getCant_material() + tabla.getCant_medi() + tabla.getCant_otros());
			tabla.setImp_general(tabla.getImp_material() + tabla.getImp_medi() + tabla.getImp_otro());
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return tabla;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//**********************************REPORTE 3 CONETRADO MENSUAL*************************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla concentrado_mensual3Anual(String fechaIni, String fechaFin, String unidad, int tipo){
		conexion conex = new conexion();
		int p=0, inicio=0, fin=0;
		String mes_aux=fechaIni.substring(5, 7);
		String mes2_aux=fechaFin.substring(5, 7);
		if(mes2_aux.equals(mes_aux)){
			inicio=Integer.parseInt(mes_aux)-1;
			fin=inicio + 1;
		}else{
			fin=12;
		}
		String[] año={"2012"};
		String[] dia={"1", "30", "31", "28"};
		String[] mes={"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
		Btabla tabla = new Btabla();
		BSqlSentencia vars;
		try{
			conex.conectar();
			for(p=inicio; p<fin; p++){
				vars = new BSqlSentencia();
				vars.setPstm(conex.getCon().prepareStatement("call reporte3(?,?,?,?)"));
				vars.getPstm().setString(1, unidad);
				vars.getPstm().setString(2, año[0] + "-" + mes[p] + "-" + dia[0]);
				if(p==1)
					vars.getPstm().setString(3, año[0] + "-" + mes[p] + "-" + dia[3]);
				else if(p==0 || p==2 || p==4 || p==6 || p==7|| p==9 || p==1)
					vars.getPstm().setString(3, año[0] + "-" + mes[p] + "-" + dia[2]);
				else
					vars.getPstm().setString(3, año[0] + "-" + mes[p] + "-" + dia[1]);
				vars.getPstm().setInt(4, tipo);
				vars.setRs(vars.getPstm().executeQuery());
				while(vars.getRs().next()){
					if(vars.getRs().getString("tipo").equals("Material de Curacion")){
						tabla.getCantidades()[Integer.parseInt(mes[p]) - 1 + 12]+=vars.getRs().getInt("CANTIDAD");
						tabla.setImp_material(tabla.getImp_material()+ vars.getRs().getFloat("IMPORTE"));
					}
					else if(vars.getRs().getString("tipo").equals("Otro")){
						tabla.getCantidades()[Integer.parseInt(mes[p]) - 1 + 24]+=vars.getRs().getInt("CANTIDAD");
						tabla.setImp_otro(tabla.getImp_otro() + vars.getRs().getFloat("IMPORTE"));
					}
					else{
						tabla.getCantidades()[Integer.parseInt(mes[p]) - 1]+=vars.getRs().getInt("CANTIDAD");
						tabla.setImp_medi(tabla.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
					}
					tabla.setCant_general(tabla.getCant_general() + vars.getRs().getInt("CANTIDAD"));
					tabla.setImp_general(tabla.getImp_general() + vars.getRs().getFloat("IMPORTE"));
					if(busqueda(tabla, vars.getRs().getString("clave")) != -1){
						Brepor3 auxR=(Brepor3)tabla.getTabla().get(busqueda(tabla, vars.getRs().getString("clave")));
						auxR.setCantMes(vars.getRs().getInt("CANTIDAD"),Integer.parseInt(mes[p]));
						auxR.setImporte(vars.getRs().getFloat("IMPORTE") * auxR.cantTotal());
						tabla.getTabla().set(busqueda(tabla, vars.getRs().getString("clave")), auxR);
					}else{
						Brepor3 obj= new Brepor3();
						obj.setClave(vars.getRs().getString("clave"));
						obj.setDesc(vars.getRs().getString("descripcion"));
						obj.setPresentacion(vars.getRs().getString("presentacion"));
						obj.setPrecio(vars.getRs().getFloat("precio_unitario"));
						obj.setImporte(vars.getRs().getFloat("IMPORTE"));
						obj.setCantMes(vars.getRs().getInt("CANTIDAD"), Integer.parseInt(mes[p]));
						tabla.agregar(obj);
					}
				}
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return tabla;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//******************************REPORTE 4 CONETRADO MENSUAL UNI Y PRO*******************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla concentrado_mensual_pro4(String fechaIni, String fechaFin,String unidad, int tipo, int programa){
		conexion conex = new conexion();
		int p=0, inicio=0, fin=0;
		String mes_aux=fechaIni.substring(5, 7);
		String mes2_aux=fechaFin.substring(5, 7);
		if(mes2_aux.equals(mes_aux)){
			inicio=Integer.parseInt(mes_aux)-1;
			fin=inicio + 1;
		}else{
			fin=12;
		}
		String[] año={"2012"};
		String[] dia={"1", "30", "31", "28"};
		String[] mes={"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
		Btabla tabla = new Btabla();
		BSqlSentencia vars;
		try{
			conex.conectar();
			for(p=inicio; p<fin; p++){
				vars = new BSqlSentencia();
				vars.setPstm(conex.getCon().prepareStatement("call reporte4(?,?,?,?,?)"));
				vars.getPstm().setString(1, unidad);
				vars.getPstm().setString(2, año[0] + "-" + mes[p] + "-" + dia[0]);
				if(p==1)
					vars.getPstm().setString(3, año[0] + "-" + mes[p] + "-" + dia[3]);
				else if(p==0 || p==2 || p==4 || p==6 || p==7|| p==9 || p==1)
					vars.getPstm().setString(3, año[0] + "-" + mes[p] + "-" + dia[2]);
				else
					vars.getPstm().setString(3, año[0] + "-" + mes[p] + "-" + dia[1]);
				vars.getPstm().setInt(4, tipo);
				vars.getPstm().setInt(5, programa);
				vars.setRs(vars.getPstm().executeQuery());
				while(vars.getRs().next()){
					if(vars.getRs().getString("tipo").equals("Material de Curacion")){
						tabla.getCantidades()[Integer.parseInt(mes[p]) - 1 + 12]+=vars.getRs().getInt("CANTIDAD");
						tabla.setImp_material(tabla.getImp_material()+ vars.getRs().getFloat("IMPORTE"));
					}
					else if(vars.getRs().getString("tipo").equals("Otro")){
						tabla.getCantidades()[Integer.parseInt(mes[p]) - 1 + 24]+=vars.getRs().getInt("CANTIDAD");
						tabla.setImp_otro(tabla.getImp_otro() + vars.getRs().getFloat("IMPORTE"));
					}
					else{
						tabla.getCantidades()[Integer.parseInt(mes[p]) - 1]+=vars.getRs().getInt("CANTIDAD");
						tabla.setImp_medi(tabla.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
					}
					tabla.setCant_general(tabla.getCant_general() + vars.getRs().getInt("CANTIDAD"));
					tabla.setImp_general(tabla.getImp_general() + vars.getRs().getFloat("IMPORTE"));
					if(busqueda(tabla, vars.getRs().getString("clave")) != -1){
						Brepor3 auxR=(Brepor3)tabla.getTabla().get(busqueda(tabla, vars.getRs().getString("clave")));
						auxR.setCantMes(vars.getRs().getInt("CANTIDAD"),Integer.parseInt(mes[p]));
						auxR.setImporte(vars.getRs().getFloat("IMPORTE") * auxR.cantTotal());
						tabla.getTabla().set(busqueda(tabla, vars.getRs().getString("clave")), auxR);
					}else{
						Brepor3 obj= new Brepor3();
						obj.setClave(vars.getRs().getString("clave"));
						obj.setDesc(vars.getRs().getString("descripcion"));
						obj.setPresentacion(vars.getRs().getString("presentacion"));
						obj.setPrecio(vars.getRs().getFloat("precio_unitario"));
						obj.setImporte(vars.getRs().getFloat("IMPORTE"));
						obj.setCantMes(vars.getRs().getInt("CANTIDAD"), Integer.parseInt(mes[p]));
						tabla.agregar(obj);
					}
				}
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return tabla;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//******************************REPORTE 5 DETALLADO POR RECETA*******************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte5(String unidad, String fechaIni, String fechaFin, int servicio, int programa, String tipo_receta){
		Btabla res= new Btabla();
		conexion conex = new conexion();
		BSqlSentencia vars= new BSqlSentencia();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte5(?,?,?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaIni);
			vars.getPstm().setString(3, fechaFin);
			vars.getPstm().setInt(4, servicio);
			vars.getPstm().setInt(5, programa);
			vars.getPstm().setString(6, tipo_receta);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				if(vars.getRs().getString("tipo").equals("Material de Curacion")){
					res.setCant_material(res.getCant_material() +  vars.getRs().getInt("cant_surtida"));
					res.setImp_material(res.getImp_material()+ vars.getRs().getFloat("IMPORTE"));
				}
				else if(vars.getRs().getString("tipo").equals("Otro")){
					res.setCant_otros(res.getCant_otros() + vars.getRs().getInt("cant_surtida"));
					res.setImp_otro(res.getImp_otro() + vars.getRs().getFloat("IMPORTE"));
				}
				else{
					res.setCant_medi(res.getCant_medi() + vars.getRs().getInt("cant_surtida"));
					res.setImp_medi(res.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
				}
				res.setCant_general(res.getCant_general() + vars.getRs().getInt("cant_surtida"));
				res.setImp_general(res.getImp_general() + vars.getRs().getFloat("IMPORTE"));
				res.agregar(new Brepor5(vars.getRs().getInt("id"), vars.getRs().getInt("folio"), vars.getRs().getString("fecha"), vars.getRs().getString("BENEFICIARIO"), vars.getRs().getString("descripcion"), vars.getRs().getString("presentacion"), vars.getRs().getInt("id_origen"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getInt("cant_surtida"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*************************************REPORTE 6 DETALLADO SEMANA***********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public Btabla reporte6(String unidad, String semana, int programa, String tipo_receta, int servicio){
		Btabla res= new Btabla();
		String[] fechas=obtener_fechas(semana);
		conexion conex = new conexion();
		BSqlSentencia vars;
		try{
			conex.conectar();
			for(int i=0; i<7; i++){
				vars=new BSqlSentencia();
				vars.setPstm(conex.getCon().prepareStatement("call reporte6(?,?,?,?,?,?)"));
				vars.getPstm().setString(1, unidad);
				vars.getPstm().setString(2, fechas[i]);
				vars.getPstm().setString(3, fechas[i]);
				vars.getPstm().setString(4, tipo_receta);
				vars.getPstm().setInt(5, programa);
				vars.getPstm().setInt(6, servicio);
				vars.setRs(vars.getPstm().executeQuery());
				while(vars.getRs().next()){
					if(vars.getRs().getString("tipo").equals("Material de Curacion")){
						res.agregarCantidades(res.getCantidades()[i] + vars.getRs().getInt("CANTIDAD"), i);
						res.setImp_material(res.getImp_material()+ vars.getRs().getFloat("IMPORTE"));
					}else if(vars.getRs().getString("tipo").equals("Medicamento")){
						res.agregarCantidades(res.getCantidades()[7+i] + vars.getRs().getInt("CANTIDAD"), 7+i);
						res.setImp_medi(res.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
					}
					res.setImp_general(res.getImp_general() + vars.getRs().getFloat("IMPORTE"));
					if(busquedaR6(res, vars.getRs().getString("clave")) != -1){
						Brepor6 auxR=(Brepor6)res.getTabla().get(busquedaR6(res, vars.getRs().getString("clave")));
						auxR.setCantidadSemana(vars.getRs().getInt("CANTIDAD"), i + 1);
						auxR.setImporte(auxR.getImporte() + vars.getRs().getFloat("IMPORTE"));
						res.getTabla().set(busqueda(res, vars.getRs().getString("clave")), auxR);
					}else{
						Brepor6 obj= new Brepor6();
						obj.setClave(vars.getRs().getString("clave"));
						obj.setDescripcion(vars.getRs().getString("descripcion"));
						obj.setCantidad(vars.getRs().getInt("CANTIDAD"));
						obj.setPrecio(vars.getRs().getFloat("precio_unitario"));
						obj.setImporte(vars.getRs().getFloat("IMPORTE"));
						obj.setCantidadSemana(vars.getRs().getInt("CANTIDAD"), i+1);
						res.agregar(obj);
					}
				}
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	//***********************REPORTE 7 REPORTE DETALLADO POR MÉDICO************************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte7(String unidad, String fechaIni, String fechaFin, int cedula){
		Btabla res = new Btabla();
		conexion conex= new conexion();
		BSqlSentencia vars= new BSqlSentencia();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte7(?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaIni);
			vars.getPstm().setString(3, fechaFin);
			vars.getPstm().setInt(4, cedula);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){				
				res.agregar(new Brepor7(vars.getRs().getInt("folio"), vars.getRs().getString("fecha"), vars.getRs().getString("nombre"), vars.getRs().getString("descripcion"), vars.getRs().getInt("id_origen"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getInt("cant_surtida"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//***********************REPORTE 8 REPORTE DETALLADO POR BENEFICIARIO******************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte8(String unidad, String fechaIni, String fechaFin, int id){
		System.out.println(unidad + " " + fechaIni + " " + fechaFin + " " + id);
		Btabla res = new Btabla();
		conexion conex= new conexion();
		BSqlSentencia vars= new BSqlSentencia();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte8(?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaIni);
			vars.getPstm().setString(3, fechaFin);
			vars.getPstm().setInt(4, id);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){				
				res.agregar(new Brepor8(vars.getRs().getInt("folio"), vars.getRs().getString("fecha"), vars.getRs().getString("descripcion"), vars.getRs().getInt("id_origen"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getInt("cant_surtida"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	//***********************REPORTE 9 REPORTE DETALLADO POR RECETA******************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte9(String unidad, String fechaI, String fechaF, int programa, String tipoReceta, int servicio){
		Btabla res = new Btabla();
		conexion conex= new conexion();
		BSqlSentencia vars= new BSqlSentencia();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte9(?,?,?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.getPstm().setInt(4, programa);
			vars.getPstm().setString(5, tipoReceta);
			vars.getPstm().setInt(6, servicio);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				if(vars.getRs().getString("tipo").equals("Material de Curacion")){
					res.setCant_material(res.getCant_material() +  vars.getRs().getInt("cant_surtida"));
					res.setImp_material(res.getImp_material()+ vars.getRs().getFloat("IMPORTE"));
				}
				else if(vars.getRs().getString("tipo").equals("Otro")){
					res.setCant_otros(res.getCant_otros() + vars.getRs().getInt("cant_surtida"));
					res.setImp_otro(res.getImp_otro() + vars.getRs().getFloat("IMPORTE"));
				}
				else{
					res.setCant_medi(res.getCant_medi() + vars.getRs().getInt("cant_surtida"));
					res.setImp_medi(res.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
				}
				res.setCant_general(res.getCant_general() + vars.getRs().getInt("cant_surtida"));
				res.setImp_general(res.getImp_general() + vars.getRs().getFloat("IMPORTE"));
				res.agregar(new Brepor9(vars.getRs().getInt("id"), vars.getRs().getInt("folio"), vars.getRs().getString("fecha"), vars.getRs().getString("BENEFICIARIO"), vars.getRs().getString("descripcion"), vars.getRs().getInt("id_origen"), vars.getRs().getInt("cant_surtida"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 10 STOCK POR UNIDAD****************************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte10(String unidad, int mes){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte10(?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setInt(2, mes);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor10(vars.getRs().getString("clave"), vars.getRs().getString("descripcion"), vars.getRs().getInt("existencias"), vars.getRs().getInt("stock_min"), vars.getRs().getInt("stock_max")));
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 11 DESVIACION CONTINGENCIA***********************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte11(String unidad, String fechaI, String fechaF){
		Btabla res = new Btabla();
		int ini=0, fin=1, mes=1;
		String mes_aux=fechaI.substring(5, 7);
		System.out.println(mes_aux);
		String mes2_aux=fechaF.substring(5, 7);
		if(!mes_aux.equals(mes2_aux)){
			fin=12;
		}else{
			ini=Integer.parseInt(mes_aux)-1;
			fin=ini + 1;
		}
		BSqlSentencia vars;
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars = new BSqlSentencia();
			vars.setPstm(conex.getCon().prepareStatement("call insumo_r11(?)"));
			vars.getPstm().setString(1, unidad);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor11(vars.getRs().getString("clave_insumo"), vars.getRs().getString("descripcion")));
			}
			for(ini=Integer.parseInt(mes_aux)-1; ini<fin; ini++){
				mes=1;
				mes += ini;
				vars = new BSqlSentencia();
				vars.setPstm(conex.getCon().prepareStatement("call reporte11(?,?,?)"));
				vars.getPstm().setString(1, unidad);
				vars.getPstm().setString(2, "2012-" + String.valueOf(mes) + "-1");
				vars.getPstm().setString(3, obtenerFechas12(ini));
				vars.setRs(vars.getPstm().executeQuery());
				while(vars.getRs().next()){
					if(busquedaR11(res, vars.getRs().getString("clave")) != -1){
						Brepor11 auxR=(Brepor11)res.getTabla().get(busquedaR11(res, vars.getRs().getString("clave")));
						auxR.setCantMes(vars.getRs().getInt("cant_surtida"), mes);
						res.getTabla().set(busquedaR11(res, vars.getRs().getString("clave")), auxR);
					}
				}
			}
			conex.getCon().close();
		}catch(Exception e){
			conex.cerrar();
			System.out.println(e);
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 12- INCIDENCIA EPIDEMIOLOGICA********************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte12(String unidad, String fechaI, String fechaF){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte12(?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor12(vars.getRs().getString("id_causes"), vars.getRs().getString("nombre"), vars.getRs().getInt("incidencia")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	//////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 13 ATRASO MENSUAL EN ENTREGAS********************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte13(String unidad, String fechaI, String fechaF){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex= new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte13(?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor13(vars.getRs().getInt("folio_receta"), vars.getRs().getString("clave_medicamento"), vars.getRs().getString("descripcion"), vars.getRs().getInt("cant_solicitada"), vars.getRs().getString("fecha_solicitud"), vars.getRs().getString("fecha_abasto"), vars.getRs().getInt("ATRASO"), vars.getRs().getInt("id_origen"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 14 INSUMOS NO ABASTECIDOS************************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte14(String unidad, String fechaI, String fechaF, int programa){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte14(?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.getPstm().setInt(4, programa);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor14(vars.getRs().getString("nombre"), vars.getRs().getInt("folio_receta"), vars.getRs().getString("clave_medicamento"), vars.getRs().getString("descripcion"), vars.getRs().getString("fecha_solicitud"), vars.getRs().getInt("cant_solicitada"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 15 CONTROL DE PSICOTROPICOS**********************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte15(String unidad, int cedula){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte15(?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setInt(2, cedula);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				/*res.agregar(new Brepor15(vars.getRs().getInt("id"), vars.getRs().getString("nombre"), vars.getRs().getInt("cedula_profesional"),
						vars.getRs().getString("domicilio"), vars.getRs().getString("fecha_entrada"), vars.getRs().getInt("no_factura"),
						vars.getRs().getString("domicilio_proveedor"), vars.getRs().getInt("entrada"), vars.getRs().getInt("catn_surtida"),
						vars.getRs().getInt("saldo_insumo"), vars.getRs().getString("clave")));*/
				res.agregar(new Brepor15(vars.getRs().getInt("id"), vars.getRs().getString("nombre"),
						vars.getRs().getInt("cedula_profesional"), vars.getRs().getString("domicilio"), vars.getRs().getInt("catn_surtida"),
						vars.getRs().getInt("saldo_insumo"), vars.getRs().getString("clave")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 16 CONTROL DE ANTIBIÓTICOS************************
	///////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte16(String clave, String unidad, String fechaI, String fechaF){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte16(?,?,?,?)"));
			vars.getPstm().setString(1, clave);
			vars.getPstm().setString(2, unidad);
			vars.getPstm().setString(3, fechaI);
			vars.getPstm().setString(4, fechaF);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor16(vars.getRs().getString("fecha"), vars.getRs().getInt("cant_solicitada"), vars.getRs().getInt("cant_surtida"),
						vars.getRs().getString("descripcion"), vars.getRs().getInt("folio"), vars.getRs().getString("PACIENTE"),
						vars.getRs().getString("MEDICO"), vars.getRs().getInt("cedula_profesional"), vars.getRs().getString("retiene_receta")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//****************************REPORTE 17 VALIDAR FACTURA POR UNIDAD Y PRO********************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte17(String unidad, String fechaI, String fechaF, int origen, int tipo_Receta){
		Btabla res = new Btabla();
		conexion conex = new conexion();
		BSqlSentencia vars = new BSqlSentencia();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte17(?,?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.getPstm().setInt(4, origen);
			if(tipo_Receta == 1){
				vars.getPstm().setString(5, "Receta Farmacia");
			}else{
				vars.getPstm().setString(5, "Receta Colectiva");
			}
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor17(vars.getRs().getString("clave"), vars.getRs().getString("descripcion"), vars.getRs().getString("presentacion"), vars.getRs().getInt("CANTIDAD")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*****REPORTE 18 CONCENTRADO DE INSUMOS DISPENSADOS  POR MES POR UNIDAD PARA VALIDACIÓN DE FACTURA******
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte18(String unidad, String fechaI, String fechaF){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte18(?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor18(vars.getRs().getString("clave_medicamento"), vars.getRs().getString("descripcion"),
						vars.getRs().getFloat("precio_unitario"), vars.getRs().getFloat("precio_unitario") + (float) 7.45,
						vars.getRs().getInt("CANTIDAD"), vars.getRs().getFloat("TOTAL"), vars.getRs().getInt("id_origen"),
						vars.getRs().getFloat("IMPORTE_L"),vars.getRs().getFloat("IMPORTE_A"),
						vars.getRs().getFloat("IMPORTE_L") + vars.getRs().getFloat("IMPORTE_A")));
			}
				
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************REPORTE 19 ANALISIS  DE  DESPLAZAMIENTO ( %) DIARIO************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte19(String unidad, String fechaI, String fechaF){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte19(?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Brepor19(vars.getRs().getString("tipo"), vars.getRs().getString("clave_medicamento"),vars.getRs().getString("descripcion"),
						vars.getRs().getString("descripcion"), vars.getRs().getString("presentacion"), vars.getRs().getInt("SOLICITADO"),
						vars.getRs().getInt("SURTIDO"), porcentaje(vars.getRs().getInt("SOLICITADO"), vars.getRs().getInt("SURTIDO"))));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//************************************REPORTE 20 MOVIMIENTOS MINIMOS************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte20(String unidad, String fechaI, String fechaF, int origen){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte20(?,?,?,?)"));
			vars.getPstm().setString(1, unidad);
			vars.getPstm().setString(2, fechaI);
			vars.getPstm().setString(3, fechaF);
			vars.getPstm().setInt(4, origen);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				if(vars.getRs().getString("tipo").equals("Medicamento")){
					res.setCant_medi(res.getCant_medi() + vars.getRs().getInt("CANTIDAD"));
					res.setImp_medi(res.getImp_medi() + vars.getRs().getFloat("IMPORTE"));
				}else if(vars.getRs().getString("tipo").equals("Material de Curacion")){
					res.setCant_material(res.getCant_material() + vars.getRs().getInt("CANTIDAD"));
					res.setImp_material(res.getImp_material() + vars.getRs().getFloat("IMPORTE"));
				}else{
					res.setCant_otros(res.getCant_otros() + vars.getRs().getInt("CANTIDAD"));
					res.setImp_otro(res.getImp_otro() + vars.getRs().getFloat("IMPORTE"));
				}
				res.setCant_general(res.getCant_general() + vars.getRs().getInt("CANTIDAD"));
				res.setImp_general(res.getImp_general() + vars.getRs().getFloat("IMPORTE"));
				res.agregar(new Brepor20(vars.getRs().getString("JUR"), vars.getRs().getString("MUNI"), vars.getRs().getString("UNIDAD"),
						vars.getRs().getString("clave_medicamento"), vars.getRs().getString("descripcion"), vars.getRs().getInt("CANTIDAD"),
						vars.getRs().getFloat("precio_unitario"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//**********************REPORTE 21 MENSUAL DE LAS 50 CLAVES CON MAYOR MOVIMIENTO*************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla reporte21(int opcion, String unidad, String fechaI, String fechaF, int origen){
		Btabla res = new Btabla();
		BSqlSentencia vars = new BSqlSentencia();
		conexion conex = new conexion();
		String uni=unidad.substring(0, 1);
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call reporte21(?,?,?,?,?)"));
			vars.getPstm().setInt(1, opcion);
			if(uni.equals("u")){
				vars.getPstm().setString(2, unidad);
			}else{
				vars.getPstm().setInt(2, Integer.parseInt(unidad));
			}
			vars.getPstm().setString(3, fechaI);
			vars.getPstm().setString(4, fechaF);
			vars.getPstm().setInt(5, origen);
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				if(vars.getRs().getString("tipo").equals("Medicamento")){
					res.setCant_medi(res.getCant_medi() + vars.getRs().getInt("CANTIDAD"));
					res.setImp_medi(res.getImp_medi() + vars.getRs().getInt("CANTIDAD"));
				}else if(vars.getRs().getString("tipo").equals("Material de Curacion")){
					res.setCant_material(res.getCant_material() + vars.getRs().getInt("CANTIDAD"));
					res.setImp_material(res.getImp_material() + vars.getRs().getInt("CANTIDAD"));
				}else if(vars.getRs().getString("tipo").equals("Otro")){
					res.setCant_otros(res.getCant_otros() + vars.getRs().getInt("CANTIDAD"));
					res.setImp_otro(res.getImp_otro() + vars.getRs().getInt("CANTIDAD"));
				}
				res.setCant_general(res.getCant_general() + vars.getRs().getInt("CANTIDAD"));
				res.setImp_general(res.getImp_general() + vars.getRs().getInt("CANTIDAD"));
				res.agregar( new Brepor21(vars.getRs().getString("clave_medicamento"), vars.getRs().getString("descripcion"),
						vars.getRs().getInt("CANTIDAD"), vars.getRs().getFloat("precio_unitario"), vars.getRs().getFloat("IMPORTE")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//**********************************INSERCION DE DATOS**************************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public ArrayList<String[]> insertarDAtos(String ruta, String nombreArchivo, String rutaAlmacenamientoTemp){
		ArrayList<String[]> res = new ArrayList<String[]>();
		Butilidades file= new Butilidades(ruta, rutaAlmacenamientoTemp);
		try{
			if(nombreArchivo.endsWith("rar")){
				res=file.descomprimirRAR();
			}else if(nombreArchivo.endsWith("zip")){
				res=file.descomprimirZIP();
			}else if(nombreArchivo.endsWith("xls")){
				res=file.leerXLS();
			}else if(nombreArchivo.endsWith("xlsx")){
				res=file.leerXLSX();
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*****************************************AGREGAR USUARIO***********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int agrearUsuario(String user, String rol, String pass){
		conexion conex = new conexion();
		BSqlSentencia vars = new BSqlSentencia();
		int res=0;
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call agregarUser(?,?,?)"));
			vars.getPstm().setString(1, user);
			vars.getPstm().setString(2, rol);
			vars.getPstm().setString(3, pass);
			res=vars.getPstm().executeUpdate();
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*****************************************MOSTRAR USUARIOS***********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Btabla mostrarUsuarios(){
		conexion conex = new conexion();
		BSqlSentencia vars = new BSqlSentencia();
		Btabla res = new Btabla();
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call mostrarUsers()"));
			vars.setRs(vars.getPstm().executeQuery());
			while(vars.getRs().next()){
				res.agregar(new Busuario(vars.getRs().getInt("id"), vars.getRs().getString("usuario"), vars.getRs().getString("rol")));
			}
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*****************************************ELIMINAR USUARIO***********************************************
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int eliminarUsuario(String id){
		conexion conex = new conexion();
		BSqlSentencia vars = new BSqlSentencia();
		int res=0;
		try{
			conex.conectar();
			vars.setPstm(conex.getCon().prepareStatement("call eliminarUsers(?)"));
			vars.getPstm().setInt(1, Integer.parseInt(id));
			res=vars.getPstm().executeUpdate();
			conex.getCon().close();
		}catch(Exception e){
			System.out.println(e);
			conex.cerrar();
		}
		return res;
	}
	/////////////////////////////////////////////////
	//***************METODOS************************
	////////////////////////////////////////////////
	
	public float porcentaje(int val_1, int val_2){
		float res=0;
		res=(val_2 * 100)/val_1;
		return res;
	}
	public String obtenerFechas12(int p){
		String[] año={"2012"};
		String[] dia={"1", "30", "31", "28"};
		String[] mes={"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
		String res="";
		if(p==1){
			res=año[0] + "-" + mes[p] + "-" + dia[3];
			return res;
		}
		else if(p==0 || p==2 || p==4 || p==6 || p==7|| p==9 || p==1){
			res = año[0] + "-" + mes[p] + "-" + dia[2];
			return res;
		}
		else{
			res = año[0] + "-" + mes[p] + "-" + dia[1];
			return res;
		}
	}
	
	public int busqueda(Btabla mitabla, String clave){
		if(mitabla.getTabla().size()!=0){
			for(int i=0; i<mitabla.getTabla().size(); i++){
				Brepor3 obj= (Brepor3)mitabla.getTabla().get(i);
				if(clave.equals(obj.getClave()))
					return i;
			}
		}
		return -1;
	}
	
	public int busquedaR11(Btabla mitabla, String clave){
		if(mitabla.getTabla().size()!=0){
			for(int i=0; i<mitabla.getTabla().size(); i++){
				Brepor11 obj= (Brepor11)mitabla.getTabla().get(i);
				if(clave.equals(obj.getClave()))
					return i;
			}
		}
		return -1;
	}
	
	public int busquedaR6(Btabla mitabla, String clave){
		if(mitabla.getTabla().size()!=0){
			for(int i=0; i<mitabla.getTabla().size(); i++){
				Brepor6 obj= (Brepor6)mitabla.getTabla().get(i);
				if(clave.equals(obj.getClave()))
					return i;
			}
		}
		return -1;
	}
	
	public String[] obtener_fechas(String semana){
		String[] res=new String[7];
		String ano= semana.substring(0,4);
		String week= semana.substring(6, 8);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.YEAR, Integer.parseInt(ano));
		cal.set(Calendar.WEEK_OF_YEAR, Integer.parseInt(week));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		cal.set(Calendar.DAY_OF_WEEK, 1);
		for(int i=0; i<7; i++){
			cal.add(Calendar.DATE, 1);
			res[i]=formatter.format(cal.getTime());
		}
		return res;
	}

}
