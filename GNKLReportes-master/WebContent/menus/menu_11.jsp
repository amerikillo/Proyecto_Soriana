<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="../js/jqFunc.js"></script>
<script type="text/javascript" src="../js/funciones.js"></script>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="combo" scope="session" class="modelo.Bcombo"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>11- REPORTE DESVIACION DE CONTINGENCIA</title>
</head>
<body onload="ocultaEtiquetas_menu11()">
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../menus/menu.jsp">Regresar al menú</a>
	<input type="hidden" id="caso" name="caso" value="" />
	<input type="hidden" id="combo1" name="combo1" value="" />
	<input type="hidden" id="casosql" name="casosql" value="" />
	<input type="hidden" id="valorFecha" name="valorFecha" value="" />
	
	<form name="frmMenu11" action="../ServletControl" onsubmit="return validarMenu11()" method="post">
		<input type="hidden" name="caso" value="110" />
		Jurisdicción: 
		<select name="cmbJur" id="cmbJur">
			<option value="0">-- Seleccione --</option>
			<%
				if(combo.getDatos().size()>0){
					for(int i=0; i<combo.getDatos().size(); i++){
						out.println("<option value = " + combo.getId().get(i) + ">" + combo.getDatos().get(i) + "</option>");
					}
				}
			%>
		</select>
		<label id="lblJur" style="color: red;">*</label>
		<br></br>
		
		Municipio: 
		<select name="cmbMunicipio" id="cmbMunicipio">
			<option value="0">-- Seleccione --</option>
			
		</select>
		<label id="lblMun" style="color: red;">*</label>
		<br></br>
		
		Unidad de atención:
		<select name="cmbUnidad" id="cmbUnidad">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblUni" style="color: red;">*</label>
		<br></br>
		
		Rango de Fechas: 
		<select name="cmbFecha" id="cmbFecha">
			<option value="0">-- Seleccione --</option>
			<option value="1">Rango de Fechas de Enero</option>
			<option value="2">Rango de Fechas de Febrero</option>
			<option value="3">Rango de Fechas de Marzo</option>
			<option value="4">Rango de Fechas de Abril</option>
			<option value="5">Rango de Fechas de Mayo</option>
			<option value="6">Rango de Fechas de Junio</option>
			<option value="7">Rango de Fechas de Julio</option>
			<option value="8">Rango de Fechas de Agosto</option>
			<option value="9">Rango de Fechas de Septiembre</option>
			<option value="10">Rango de Fechas de Octubre</option>
			<option value="11">Rango de Fechas de Noviembre</option>
			<option value="12">Rango de Fechas de Diciembre</option>
			<option value="13">Todas</option>
		</select>
		<br></br>
		
		Mes seleccionado:
		<input type="text" id="txtMes" name="txtMes">
		<label id="lblFini" style="color: red;">*</label>
		<br></br>
		
		<input type="submit" name="btnEnviar" value="Enviar"/>
		
		<input type="date" name="dateIni" id="dateIni" />
		<input type="date" name="dateFin" id="dateFin" />
	</form>
</body>
</html>