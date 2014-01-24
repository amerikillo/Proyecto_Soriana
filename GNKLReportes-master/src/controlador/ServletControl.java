package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Bbien;
import modelo.Bcombo;
import modelo.Berror;
import modelo.Bpsico;
import modelo.Breceta;
import modelo.Btabla;
import modelo.Busuario;
/**
 * Servlet implementation class ServletControl
 */
@WebServlet("/ServletControl")
public class ServletControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch(Integer.parseInt(request.getParameter("caso"))){
		case 1:
			response.sendRedirect("../SSD/menus/menu_" + request.getParameter("menu") + ".jsp");
			break;
		case 2:
			SqlSentencia sentencia = new SqlSentencia();
			HttpSession sesion = request.getSession();
			Breceta rec = sentencia.receta(Integer.parseInt(request.getParameter("folio")));
			sesion.setAttribute("receta", rec);
			response.sendRedirect("Reportes/Receta_2.jsp");
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Bcombo combo;
		Bpsico psi;
		SqlSentencia sentencia = new SqlSentencia();
		Busuario user;
		Berror error = new Berror();
		Btabla res, aux;
		Bbien respuesta;
		HttpSession sesion = request.getSession();
		System.out.println(request.getParameter("caso"));
		int caso=Integer.parseInt(request.getParameter("caso"));
		switch(caso){
		///////////////////////////////////////////////////////////////////////////////////////
		//*******************************INICIO DE SESION*************************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 1000:
			user = new Busuario();
			if(sentencia.autenticar(request.getParameter("txtUser"), request.getParameter("txtPass"), user, error)){
				sesion.setAttribute("usuario", user);
				sesion.setAttribute("msj", error);
				String URL = request.getContextPath() + "/menus/menuPrincipal.jsp";
				response.sendRedirect(URL);
			}else{
				sesion.setAttribute("error", error);
				response.sendRedirect("login.jsp");
			}
			break;
			
		///////////////////////////////////////////////////////////////////////////////////////
		//*******************************REEDIRECCION A MENUS**********************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		case 18:
		case 19:
		case 20:
		case 21:
		case 22:
			combo= new Bcombo();
			sentencia.llenaCombo(combo, "", "");
			if(caso==16){
				Bcombo psico= new Bcombo();
				sentencia.llenaPsicotropico(psico);
				sesion.setAttribute("claveP", psico);
			}
			if(caso!=3){
				Bcombo programa= new Bcombo();
				sentencia.llenaPrograma(programa);
				sesion.setAttribute("programa", programa);
			}
			sesion.setAttribute("combo", combo);
			response.sendRedirect(request.getContextPath() + "/menus/menu_" + caso +".jsp");
			break;
			
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 2 CONCETRADO SALIDAS****************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 200:
			res = new Btabla();
			Btabla tabla2 = new Btabla();
			res = sentencia.concentrado_salidas2(request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbPrograma")), request.getParameter("cmbUnidad"), 2);
			tabla2 = sentencia.concentrado_salidas2(request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbPrograma")), request.getParameter("cmbUnidad"), 1);
			sesion.setAttribute("tabla", res);
			sesion.setAttribute("tablaS", tabla2);
			response.sendRedirect("../SSD/Reportes/R2_ConcentradoSalidas.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 3 CONCETRADO MENSUAL****************************
		///////////////////////////////////////////////////////////////////////////////////////	
		case 30:
			res = new Btabla();
			Btabla tablaR3_ = new Btabla();
			res = sentencia.concentrado_mensual3Anual(request.getParameter("dateIni"), request.getParameter("dateFin"), request.getParameter("cmbUnidad"), 1);
			tablaR3_ = sentencia.concentrado_mensual3Anual(request.getParameter("dateIni"), request.getParameter("dateFin"), request.getParameter("cmbUnidad"), 2);
			sesion.setAttribute("tabla", res);
			sesion.setAttribute("tablaSor", tablaR3_);
			response.sendRedirect("../SSD/Reportes/R3_ConcetradoMensual.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 4 CONCETRADO MENSUAL UNI Y PRO************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 40:
			res = new Btabla();
			Btabla tablaR4_ = new Btabla();
			if(request.getParameter("cmbPrograma").equals("10")){
				res = sentencia.concentrado_mensual3Anual(request.getParameter("dateIni"), request.getParameter("dateFin"), request.getParameter("cmbUnidad"), 1);
				tablaR4_ = sentencia.concentrado_mensual3Anual(request.getParameter("dateIni"), request.getParameter("dateFin"), request.getParameter("cmbUnidad"), 2);
			}else{
				res = sentencia.concentrado_mensual_pro4(request.getParameter("dateIni"), request.getParameter("dateFin"), request.getParameter("cmbUnidad"), 1, Integer.parseInt(request.getParameter("cmbPrograma")));
				tablaR4_ = sentencia.concentrado_mensual_pro4(request.getParameter("dateIni"), request.getParameter("dateFin"), request.getParameter("cmbUnidad"), 2, Integer.parseInt(request.getParameter("cmbPrograma")));
			}
			sesion.setAttribute("tabla", res);
			sesion.setAttribute("tablaSor", tablaR4_);
			response.sendRedirect("../SSD/Reportes/R4_ConcentradoMensual.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 5 CONCETRADO MENSUAL UNI Y PRO************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 50:
			res = new Btabla();
			res=sentencia.reporte5(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbServicio")), Integer.parseInt(request.getParameter("cmbPrograma")), request.getParameter("cmbReceta"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R5_detalladoReceta.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 6 REPORTE DETALLADO SEMANAL************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 60:
			res = new Btabla();
			res=sentencia.reporte6(request.getParameter("cmbUnidad"), request.getParameter("dateSem"), Integer.parseInt(request.getParameter("cmbPrograma")), request.getParameter("cmbReceta"), Integer.parseInt(request.getParameter("cmbServicio")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R6_DetalladoSemanal.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 7 REPORTE DETALLADO POR MÉDICO************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 70:
			res = new Btabla();
			res=sentencia.reporte7(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbMedico")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R7_DetalladoMedico.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 8 REPORTE DETALLADO POR BENEFICIARIO******************
		///////////////////////////////////////////////////////////////////////////////////////
		case 80:
			res = new Btabla();
			res=sentencia.reporte8(request.getParameter("cmbUnidad"), request.getParameter("dateIni2"), request.getParameter("dateFin2"), Integer.parseInt(request.getParameter("cmbBeneficiario")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R8_DetalladoBeneficiario.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 9 REPORTE DETALLADO POR RECETA******************
		///////////////////////////////////////////////////////////////////////////////////////
		case 90:
			res= new Btabla();
			res=sentencia.reporte9(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbPrograma")), request.getParameter("cmbReceta"), Integer.parseInt(request.getParameter("cmbServicio")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R9_DetalladoReceta.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 10 STOCK POR UNIDAD****************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 100:
			System.out.println(request.getParameter("dateMon"));
			res= new Btabla();
			res=sentencia.reporte10(request.getParameter("cmbUnidad"), Integer.parseInt(request.getParameter("dateMon").substring(5, 7)));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R10_StockPorUnidad.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 11 DESVIACION CONTINGENCIA****************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 110:
			res = new Btabla();
			res = sentencia.reporte11(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R11_ConsumoMensual.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 12- INCIDENCIA EPIDEMIOLOGICA********************
		///////////////////////////////////////////////////////////////////////////////////////
		case 120:
			res = new Btabla();
			res=sentencia.reporte12(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R12_IncidenciaEpidemologica.jsp");
			break;
		//////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 13 ATRASO MENSUAL EN ENTREGAS********************
		///////////////////////////////////////////////////////////////////////////////////////
		case 130:
			res = new Btabla();
			res = sentencia.reporte13(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R13_AtrasoMensual.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 14 INSUMOS NO ABASTECIDOS************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 140:
			res = new Btabla();
			res = sentencia.reporte14(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbPrograma")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R14_InsumoNoAbastecido.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 15 CONTROL DE PSICOTROPICOS************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 150:
			res = new Btabla();
			res = sentencia.reporte15(request.getParameter("cmbUnidad_15"), Integer.parseInt(request.getParameter("cmbMedico_15")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R15_ControlPsicotropicos.jsp");
			break;
		///////////////////////////////////////////////////////////////////////////////////////
		//****************************REPORTE 16 CONTROL DE ANTIBIÓTICOS************************
		///////////////////////////////////////////////////////////////////////////////////////
		case 160:
			res = new Btabla();
			res = sentencia.reporte16(request.getParameter("cmbClave"), request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R16_ControlAntibiotico.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////
		//***********************REPORTE 17 VALIDAR FACTURA POR UNIDAD Y PRO*************************
		/////////////////////////////////////////////////////////////////////////////////////////////
		case 170:
			res = new Btabla();
			res=sentencia.reporte17(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), Integer.parseInt(request.getParameter("cmbOrigen")), Integer.parseInt(request.getParameter("casoReceta")));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R17_ReporteValidacion.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*****REPORTE 18 CONCENTRADO DE INSUMOS DISPENSADOS  POR MES POR UNIDAD PARA VALIDACIÓN DE FACTURA******
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 180:
			res = new Btabla();
			res = sentencia.reporte18(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R18_ConcentradoInsumoDispensadoMes.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//***************************REPORTE 19 ANALISIS  DE  DESPLAZAMIENTO ( %) DIARIO************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 190:
			res = new Btabla();
			res = sentencia.reporte19(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"));
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/Reportes/R19_AnalisisDesplazamiento.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//************************************REPORTE 20 MOVIMIENTOS MINIMOS************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 20000:
			res = new Btabla();
			aux = new Btabla();
			res = sentencia.reporte20(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), 1);
			aux = sentencia.reporte20(request.getParameter("cmbUnidad"), request.getParameter("dateIni"), request.getParameter("dateFin"), 2);
			sesion.setAttribute("tabla", res);
			sesion.setAttribute("tabla_2", aux);
			response.sendRedirect("../SSD/Reportes/R20_MovimientosMinimos.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//**********************REPORTE 21 MENSUAL DE LAS 50 CLAVES CON MAYOR MOVIMIENTO*************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 210:
			res = new Btabla();
			aux = new Btabla();
			if(request.getParameter("cmbCaso").equals("1")){
				res=sentencia.reporte21(Integer.parseInt(request.getParameter("cmbCaso")), "0", "2012-01-01", "2012-12-31", 1);
				aux=sentencia.reporte21(Integer.parseInt(request.getParameter("cmbCaso")), "0", "2012-01-01", "2012-12-31", 2);
			}else if(request.getParameter("cmbCaso").equals("2")){
				res=sentencia.reporte21(Integer.parseInt(request.getParameter("cmbCaso")), request.getParameter("cmbJur_21"), "2012-01-01", "2012-12-31", 1);
				aux=sentencia.reporte21(Integer.parseInt(request.getParameter("cmbCaso")), request.getParameter("cmbJur_21"), "2012-01-01", "2012-12-31", 2);
			}else if(request.getParameter("cmbCaso").equals("3")){
				res=sentencia.reporte21(Integer.parseInt(request.getParameter("cmbCaso")), request.getParameter("cmbUnidad_21"), request.getParameter("dateIni_21"), request.getParameter("dateFin_21"), 1);
				aux=sentencia.reporte21(Integer.parseInt(request.getParameter("cmbCaso")), request.getParameter("cmbUnidad_21"), request.getParameter("dateIni_21"), request.getParameter("dateFin_21"), 2);
			}
			sesion.setAttribute("tabla", res);
			sesion.setAttribute("tabla_Sor", aux);
			response.sendRedirect("../SSD/Reportes/R21_ClavesMayorMovimiento.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//**************************************TICKET**********************************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 2222:
			Breceta rec = sentencia.receta(Integer.parseInt(request.getParameter("folio")));
			sesion.setAttribute("receta", rec);
			response.sendRedirect("Reportes/Ticket.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*****************************************AGREGAR USUARIO***********************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 1111:
			respuesta = new Bbien();
			res = new Btabla();
			if(sentencia.agrearUsuario(request.getParameter("txtUser"), request.getParameter("cmbRol"), request.getParameter("txtPass"))==1){
				respuesta.setRespuesta(true);
				res=sentencia.mostrarUsuarios();
				sesion.setAttribute("tabla", res);
				sesion.setAttribute("res", respuesta);
				response.sendRedirect("gestion/gestionUsuarios.jsp");
			}else{
				respuesta.setError(true);
				sesion.setAttribute("res", respuesta);
				response.sendRedirect("gestion/gestionUsuarios.jsp");
			}
			
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*****************************************MOSTRAR USUARIOS**********************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 1112:
			res = new Btabla();
			res=sentencia.mostrarUsuarios();
			sesion.setAttribute("tabla", res);
			response.sendRedirect("../SSD/gestion/gestionUsuarios.jsp");
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*****************************************ELIMINAR USUARIO***********************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 1113:
			respuesta = new Bbien();
			res = new Btabla();
			if(sentencia.eliminarUsuario(request.getParameter("id"))==1){
				respuesta.setRespuesta(true);
				res=sentencia.mostrarUsuarios();
				sesion.setAttribute("tabla", res);
				sesion.setAttribute("res", respuesta);
				response.sendRedirect("gestion/gestionUsuarios.jsp");
			}else{
				respuesta.setError(true);
				sesion.setAttribute("res", respuesta);
				response.sendRedirect("gestion/gestionUsuarios.jsp");
			}
			
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*****************************************SUBIR ARCHIVOS***********************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 3333:
			System.out.println(request.getParameter("file"));
			ServletContext servletContext = request.getSession().getServletContext();
			String relativeWebPath = "upload/archivosTemp/";
			String absoluteDiskPath = servletContext.getRealPath(relativeWebPath);
			System.out.println(absoluteDiskPath);
			//sentencia.insertarDAtos(absoluteDiskPath);
			break;
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*************************************LLENADO DE COMBO ENCADENADO***************************************
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		case 2000:
			System.out.println(request.getParameter("caso"));
			System.out.println(request.getParameter("casosql"));
			PrintWriter out= response.getWriter();
			combo = new Bcombo();
			psi= new Bpsico();
			if(request.getParameter("casosql").equals("5") || request.getParameter("casosql").equals("6"))
				sentencia.llenaCombo(combo, request.getParameter("cmbUnidad"), request.getParameter("fechaI"), request.getParameter("fechaF"), request.getParameter("casosql"));
			else if(request.getParameter("casosql").equals("7"))
				sentencia.consultaPsico(psi, request.getParameter("combo1"));
				else
					sentencia.llenaCombo(combo, request.getParameter("combo1"), request.getParameter("casosql"));
			if(request.getParameter("casosql").equals("7")){
				System.out.println(psi.getJsonDato());
				out.println("{" + psi.getJsonDato() + "]}");
			}else{
				System.out.println(combo.getJsonDato());
				out.println("{" + combo.getJsonDato() + "]}");
			}
			out.close();
			break;
			
		case 3000:
			PrintWriter out_= response.getWriter();
			combo = new Bcombo();
			if(request.getParameter("casosql").equals("8")){
				sentencia.llenaCombo(combo, request.getParameter("unidad"));
				System.out.println(combo.getJsonDato());
				out_.println("{" + combo.getJsonDato() + "]}");
				
			}else if(request.getParameter("casosql").equals("9")){
				out_.println("{" + sentencia.llenaPrograma() + "]}");
			}else if(request.getParameter("casosql").equals("10")){
				sentencia.llenaCombo(combo, request.getParameter("combo1"), request.getParameter("casosql"));
				out_.println("{" + combo.getJsonDato() + "]}");
			}else if(request.getParameter("casosql").equals("11")){
				sentencia.llenaCombo(combo, request.getParameter("combo1"), request.getParameter("casosql"));
				out_.println("{" + combo.getJsonDato() + "]}");
			}
			out_.close();
			break;
		}
	}

}
